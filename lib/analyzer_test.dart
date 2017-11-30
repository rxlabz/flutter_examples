import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home:new Scaffold(body:new ConstDemoApp())));
}

class ConstDemoApp extends StatefulWidget {
  @override
  _ConstDemoAppState createState() => new _ConstDemoAppState();
}

class _ConstDemoAppState extends State<ConstDemoApp> {
  @override
  Widget build(BuildContext context) {
    return new Container( child: new Text('foo'));
  }
}