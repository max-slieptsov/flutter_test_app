import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';

class TodoItem extends StatefulWidget {
  final Map<String, dynamic> todoListItem;

  const TodoItem({super.key, required this.todoListItem});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isEditing = false;
  late final myController =
      TextEditingController(text: widget.todoListItem['description']);

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void toggleEdit(bool value) {
    setState(() {
      isEditing = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isEditing
        ? Expanded(
            child: TextField(
            controller: myController,
            autofocus: true,
            onChanged: (value) {
              context
                  .read<TodoCubit>()
                  .editTodo(widget.todoListItem['id'], value);
            },
            onTapOutside: (event) {
              toggleEdit(false);
            },
            onSubmitted: (value) {
              toggleEdit(false);
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Edit Todo',
            ),
          ))
        : Expanded(
            child: Row(
            children: [
              Expanded(
                  child: ListTile(
                      title: Text(
                widget.todoListItem['description'],
                style: TextStyle(
                    decoration: widget.todoListItem['isDone']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: widget.todoListItem['isDone']
                        ? Colors.grey
                        : Colors.black),
              ))),
              IconButton(
                  onPressed: () {
                    toggleEdit(true);
                  },
                  icon: const Icon(Icons.edit))
            ],
          ));
  }
}
