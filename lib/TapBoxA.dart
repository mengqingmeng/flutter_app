import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget{
  TapBoxA({Key key}):super(key:key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
            child: new Text(
              _active ? "Active" : "InActive",
              style: new TextStyle(fontSize: 30,color: Colors.white),
            )
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      )
    );
  }

}