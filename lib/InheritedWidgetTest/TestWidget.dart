import 'package:flutter/material.dart';
import 'package:flutterapp/InheritedWidgetTest/ShareDataWidget.dart';

class TestWidget extends StatefulWidget{

  @override
  __TestWidgetState createState()=> new __TestWidgetState();

}

class __TestWidgetState extends State<TestWidget>{
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("dependencies change");
  }


}