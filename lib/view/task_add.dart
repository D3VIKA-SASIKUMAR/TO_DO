import 'package:TASK/model_view/view_app.dart';
import 'package:TASK/view/bottom_sheets/addtask_bottomsheets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TaskAddView extends StatelessWidget {
  const TaskAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewApp>(builder: (context, viewmodel, child) {
      return SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: viewmodel.clrLv3,
              foregroundColor: viewmodel.clrLv4,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {
            HapticFeedback.heavyImpact();
            viewmodel.bottomSheetBuilder(const AddTaskBottomSheeet(), context);
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}
