import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/routes/routes.path.dart';

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
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: const CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        key: Key(_todo.id),
        confirmDismiss: (direction) async {
          debugPrint("DISMISS");
          var deleteTodo = await showAlertDialog(context);
          return deleteTodo;
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 0.1),
              borderRadius: BorderRadius.circular(0.1)),
          tileColor: Colors.white30,
          subtitle: Text(_todo.description),
          title: Text(
            _todo.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: IconButton(
            padding: const EdgeInsets.all(1.0),
            onPressed: (() => context.go(todoItemShell, extra: _todo)),
            icon: CircleAvatar(
              backgroundColor: _todo.completed ? Colors.green : Colors.red,
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
