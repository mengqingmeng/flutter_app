import 'package:flutter/material.dart';
import 'package:flutterapp/InheritedWidgetTest/ShareDataWidget.dart';

import 'TestWidget.dart';

class InheritedWidgetTestRoute extends StatefulWidget{

  @override
  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();

}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 19),
              child: TestWidget(),
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }

}