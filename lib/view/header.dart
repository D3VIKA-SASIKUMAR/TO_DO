import 'package:TASK/model_view/view_app.dart';
import 'package:TASK/view/bottom_sheets/delete_bottomsheet.dart';
import 'package:TASK/view/bottom_sheets/settings_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewApp>(
      builder: (context, viewmodel, child) {
        return Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text("Hey!",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: viewmodel.clrLv4)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(viewmodel.username,
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: viewmodel.clrLv4)),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    viewmodel.bottomSheetBuilder(
                      DeleteBottomSheet(), context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: viewmodel.clrLv3,
                    size: 40,
                  ),
                )),
            Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      viewmodel.bottomSheetBuilder(
                          SettingsBottomSheet(), context);
                    },
                    child: Icon(Icons.settings,
                        color: viewmodel.clrLv3, size: 40))),
          ],
        );
      },
    );
  }
}
