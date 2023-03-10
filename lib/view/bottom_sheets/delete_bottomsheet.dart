import 'package:TASK/model_view/view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewApp>(builder: (context, viewmodel, child) {
      return Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  viewmodel.deleteAllTasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewmodel.clrLv1,
                    backgroundColor: viewmodel.clrLv3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Delete All")),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  viewmodel.deleteCompletedtasks();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: viewmodel.clrLv1,
                    backgroundColor: viewmodel.clrLv3,
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text("Cut Out Settled "))
          ],
        ),
      );
    });
  }
}
