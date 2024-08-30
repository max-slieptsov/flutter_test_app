part of 'todo_cubit.dart';

sealed class TodoState {
  List<TodoModel> get todoList => [];
}

final List<TodoModel> todoInitState = [
  TodoModel(
    description: 'Learn Flutter',
    isDone: false,
    id: '1',
  ),
  TodoModel(
    description: 'Build Apps',
    isDone: false,
    id: '2',
  ),
];

final class TodoListState extends TodoState {
  @override
  final List<TodoModel> todoList;
  TodoListState(this.todoList);
}
