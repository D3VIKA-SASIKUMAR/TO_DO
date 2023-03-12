import 'package:TASK/view/header.dart';
import 'package:TASK/view/task__info.dart';
import 'package:TASK/view/task_add.dart';
import 'package:TASK/view/task_list.dart';
import 'package:flutter/material.dart';

class todo extends StatelessWidget {
  const todo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            children: const [
              Expanded(flex: 1, child: Header()),
              Expanded(flex: 1, child: TaskInfo()),
              Expanded(flex: 8, child: TaskListView()),
            ],
          ),
        ),
        floatingActionButton: const TaskAddView());
  }
}
