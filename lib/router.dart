import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app_1/cubit/todo_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

//screens
import 'screens/home.dart';
import 'screens/todo_list.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomePage();
    },
  ),
  GoRoute(
      path: '/todo',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
          child: const TodoList(),
        );
      })
]);
