import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_1/cubit/todo_cubit.dart';
import '../components/navbar.dart';
import '../widgets/build_todo_list.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Navbar(
        title: 'Todo',
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 2,
                              blurRadius: 20),
                        ],
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: buildTodoList(state.todoList)),
                ),
                SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400]),
                        onPressed: () {
                          context
                              .read<TodoCubit>()
                              .addTodo('New Todo ${state.todoList.length}');
                        },
                        child: const Center(
                          child: Text(
                            'Add Todo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))),
              ],
            );
          }),
        ),
      ),
    );
  }
}
