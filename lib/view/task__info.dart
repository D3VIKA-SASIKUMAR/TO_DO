import 'package:TASK/model_view/view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewApp>(builder: (context, viewmodel, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
               decoration: BoxDecoration(
                  color:viewmodel.clrLv2,
                  borderRadius: BorderRadius.circular(10)),
                  child:Column(
                    children: [Expanded(
                      flex:2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text("${viewmodel.numTasks}",
                          style:TextStyle(fontSize: 40,
                          color: viewmodel.clrLv3,
                          fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: FittedBox(
                        child: Text("Total Tasks",
                          style: TextStyle(
                            fontSize: 40,
                            color: viewmodel.clrLv4,
                            fontWeight: FontWeight.w600)
                          ),
                      ),
                    ),
                  ),
                    ],
                    )
              ),
            ),
      
            SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Container(
               decoration: BoxDecoration(
                  color:viewmodel.clrLv2,
                  borderRadius: BorderRadius.circular(10)),
                  child:Column(
                    children: [Expanded(
                      flex:2,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text("${viewmodel.numtaskRemaining}",
                          style:TextStyle(fontSize: 40,
                          color: viewmodel.clrLv3,
                          fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: FittedBox(
                        child: Text("To Do",
                          style: TextStyle(
                            fontSize: 40,
                            color: viewmodel.clrLv4,
                            fontWeight: FontWeight.w600)
                          ),
                      ),
                    ),
                  ),
                    ],
                    )
              ),
            ),
          ],
        ),
      );
    });
  }
}
