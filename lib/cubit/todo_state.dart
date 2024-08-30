part of 'todo_cubit.dart';

sealed class TodoState {
  List<Map<String, dynamic>> get todoList => [];
}

final List<Map<String, dynamic>> todoInitState = [
  {
    "description": 'Learn Flutter',
    "isDone": false,
    "id": '1',
  },
  {
    "description": 'Learn Dart',
    "isDone": false,
    "id": '2',
  }
];

final class TodoListState extends TodoState {
  @override
  final List<Map<String, dynamic>> todoList;
  TodoListState(this.todoList);
}
