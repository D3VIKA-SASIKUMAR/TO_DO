import 'package:TASK/model/task_models.dart';
import 'package:TASK/model/user_model.dart';
import 'package:flutter/material.dart';

class ViewApp extends ChangeNotifier {
  List<task> tasks = <task>[];
  User user = User("DEV");

  Color clrLv1 = Colors.green.shade50;
  Color clrLv2 = Colors.green.shade200;
  Color clrLv3 = Colors.green.shade800;
  Color clrLv4 = Colors.grey.shade900;

  int get numTasks => tasks.length;

  int get numtaskRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  void addtask(task newtask) {
    tasks.add(newtask);
    notifyListeners();
  }

  bool gettaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  String gettasktitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deletetask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void settaskvalue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedtasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }));
  }
}
