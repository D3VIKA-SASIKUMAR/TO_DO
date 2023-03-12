import 'dart:convert';

import 'package:TASK/helper/data_supplier.dart';
import 'package:TASK/model/task_models.dart';
import 'package:TASK/model/user_model.dart';
import 'package:flutter/material.dart';

class ViewApp extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("DEV");
  static String key = "items";
  ViewApp() {
    getExisting();
  }

  void getExisting() {
    DataSupplier.getList(key).then((value) {
      tasks = value.map((e) => Task.fromJson(jsonDecode(e))).toList();
      notifyListeners();
    });
  }

  Color clrLv1 = Colors.green.shade50;
  Color clrLv2 = Colors.green.shade200;
  Color clrLv3 = Colors.green.shade800;
  Color clrLv4 = Colors.grey.shade900;

  int get numTasks => tasks.length;

  int get numtaskRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  void refreshList() {
    DataSupplier.saveList(
            key, tasks.map((e) => jsonEncode(e.toJson())).toList())
        .then((value) {
      getExisting();
    });
  }

  void addtask(Task newtask) {
    tasks.add(newtask);
    refreshList();
  }

  bool gettaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  String gettasktitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deletetask(int taskIndex) {
    tasks.removeAt(taskIndex);
    refreshList();
  }

  void settaskvalue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    refreshList();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    refreshList();
  }

  void deleteCompletedtasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    refreshList();
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
