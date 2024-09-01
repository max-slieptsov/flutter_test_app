import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_1/cubit/todo_cubit.dart';
import 'package:go_router/go_router.dart';

//screens
import 'screens/home.dart';
import 'screens/todo_list.dart';
import 'screens/weather.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
      path: '/todo',
      builder: (context, state) {
        return BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
          child: const TodoList(),
        );
      }),
  GoRoute(
    path: '/weather',
    builder: (context, state) => const Weather(),
  )
]);
