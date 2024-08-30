import 'package:bloc/bloc.dart';

import 'package:uuid/uuid.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoListState(todoInitState));

  void addTodo(String description) {
    String id = const Uuid().v1();

    emit(TodoListState(state.todoList
      ..add({"id": id, "description": description, "isDone": false})));
  }

  void toggleIsComplete(String id, bool value) {
    final List<Map<String, dynamic>> editedTodoList =
        state.todoList.map((todo) {
      if (todo["id"] == id) {
        todo["isDone"] = value;
      }
      return todo;
    }).toList();

    emit(TodoListState(editedTodoList));
  }

  void deleteTodo(String id) {
    final List<Map<String, dynamic>> editedTodoList =
        state.todoList.where((todo) => todo["id"] != id).toList();

    emit(TodoListState(editedTodoList));
  }

  void editTodo(String id, String description) {
    final List<Map<String, dynamic>> editedTodoList =
        state.todoList.map((todo) {
      if (todo["id"] == id) {
        todo["description"] = description;
      }
      return todo;
    }).toList();

    emit(TodoListState(editedTodoList));
  }
}
