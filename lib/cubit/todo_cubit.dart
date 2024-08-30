import 'package:bloc/bloc.dart';
import 'package:flutter_test_app_1/models/todo.model.dart';

import 'package:uuid/uuid.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoListState(todoInitState));

  void addTodo(String description) {
    String id = const Uuid().v1();

    emit(TodoListState(state.todoList
      ..add(TodoModel(description: description, isDone: false, id: id))));
  }

  void toggleIsComplete(String id, bool value) {
    final List<TodoModel> editedTodoList = state.todoList.map((todo) {
      if (todo.id == id) {
        return TodoModel(
            description: todo.description, isDone: value, id: todo.id);
      }
      return todo;
    }).toList();

    emit(TodoListState(editedTodoList));
  }

  void deleteTodo(String id) {
    final List<TodoModel> editedTodoList =
        state.todoList.where((todo) => todo.id != id).toList();

    emit(TodoListState(editedTodoList));
  }

  void editTodo(String id, String description) {
    final List<TodoModel> editedTodoList = state.todoList.map((todo) {
      if (todo.id == id) {
        return TodoModel(
            description: description, isDone: todo.isDone, id: todo.id);
      }
      return todo;
    }).toList();

    emit(TodoListState(editedTodoList));
  }
}
