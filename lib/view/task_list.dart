import 'package:TASK/model_view/view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewApp>(builder: (context, viewmodel, child) {
      return Container(
          decoration: BoxDecoration(
              color: viewmodel.clrLv2,
              borderRadius: BorderRadius.vertical(top: Radius.circular(0))),
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: viewmodel.numTasks,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  viewmodel.deletetask(index);
                },
                background: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(20)),
                    child:Center(child: Icon(Icons.delete,color:Colors.red.shade900)),
                    ),
                  
                child: Container(
                  decoration: BoxDecoration(
                      color: viewmodel.clrLv1,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                      leading: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: BorderSide(width: 2, color: viewmodel.clrLv3),
                        checkColor: viewmodel.clrLv1,
                        activeColor: viewmodel.clrLv3,
                        value: viewmodel.gettaskValue(index),
                        onChanged: (value) {
                          viewmodel.settaskvalue(index, value!);
                        },
                      ),
                      title: Text(viewmodel.gettasktitle(index),
                          style: TextStyle(
                              color: viewmodel.clrLv4,
                              fontSize: 17,
                              fontWeight: FontWeight.w500))),
                ),
              );
            },
          ));
    });
  }
}
