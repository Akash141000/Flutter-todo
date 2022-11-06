import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.model.dart';

enum COMPLETED { yes, no }

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  COMPLETED? _completed = COMPLETED.no;

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameEditingController.dispose();
    descriptionEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameEditingController,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            TextFormField(
              maxLines: 4,
              controller: descriptionEditingController,
              decoration: const InputDecoration(
                label: Text('Description'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Flex(direction: Axis.horizontal, children: [
                    const Text('Completed'),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('Yes'),
                        leading: Radio(
                          value: COMPLETED.yes,
                          groupValue: _completed,
                          onChanged: (onChanged) {
                            setState(() {
                              _completed = onChanged;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: const Text('No'),
                        leading: Radio(
                          value: COMPLETED.no,
                          groupValue: _completed,
                          onChanged: (onChanged) {
                            setState(() {
                              _completed = onChanged;
                            });
                          },
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<TodoBloc, List<Todo>>(
                builder: (context, state) => ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      debugPrint("SUBMIT FORM ");
                      context.read<TodoBloc>().addTodo(Todo(
                          Random(100).toString(),
                          nameEditingController.text,
                          descriptionEditingController.text,
                          _completed == COMPLETED.yes ? true : false));

                      debugPrint("TODO ADDED");
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }
}
