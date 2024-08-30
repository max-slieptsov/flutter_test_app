import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/todo_input.dart';
import '../cubit/todo_cubit.dart';

Widget buildTodoList(List<Map<String, dynamic>> todoList) {
  return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: Checkbox(
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue;
                      }
                      return Colors.white;
                    }),
                    value: todoList[index]['isDone'],
                    onChanged: (bool? value) {
                      final completedValue = !todoList[index]['isDone'];
                      final id = todoList[index]['id'];

                      context
                          .read<TodoCubit>()
                          .toggleIsComplete(id, completedValue);
                    })),
            TodoItem(
              todoListItem: todoList[index],
            ),
            IconButton(
                onPressed: () {
                  context.read<TodoCubit>().deleteTodo(todoList[index]['id']);
                },
                icon: const Icon(Icons.delete))
          ],
        );
      });
}
