import 'package:flutter/material.dart';

import '../../../models/todo/todo.model.dart';

class TodoListItem extends StatelessWidget {
  late final Todo _todo;
  TodoListItem(this._todo);

  Future<bool> canDismiss(bool canDismiss) async {
    return canDismiss;
  }

  showAlertDialog(BuildContext context) async {
    // show the dialog
    var canDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Todo"),
          content: const Text("Confirm delete todo?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No")),
          ],
        );
      },
    );
    return canDelete;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Dismissible(
        key: Key(_todo.id),
        confirmDismiss: (direction) async {
          debugPrint("DISMISS");
          var deleteTodo = await showAlertDialog(context);
          return deleteTodo;
        },
        child: Container(
          color: _todo.completed ? Colors.blueAccent : Colors.red,
          margin: const EdgeInsets.only(bottom: 1),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                color: Colors.transparent,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _todo.name,
                        style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        _todo.description,
                        style: const TextStyle(
                            overflow: TextOverflow.fade,
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(_todo.completed.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.yellowAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
