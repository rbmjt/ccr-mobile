import 'package:flutter/material.dart';

import '../../auth_helper.dart';
import '../../colors.dart';

class AppBarDef {
  static getAppBar(BuildContext context, title, bool showCandidate) {
    return AppBar(
      title: Container(
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title, style: TextStyle(color: AppColor.headerTextColor)),
            showCandidate
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white54)),
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'candidates');
                        },
                        child: Text('Candidates',
                            style: TextStyle(
                                color: Colors.white70, fontSize: 13))))
                : Container()
          ])),
      actions: <Widget>[],
      backgroundColor: AppColor.mainColor,
    );
  }
}
