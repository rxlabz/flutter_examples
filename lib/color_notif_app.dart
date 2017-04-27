import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Scaffold(body: new ColorNotifApp())));
}

TextStyle textStyle = new TextStyle(fontSize: 20.0, color: Colors.black);

class ColorNotifApp extends StatefulWidget {
  @override
  _ColorNotifAppState createState() => new _ColorNotifAppState();
}

class _ColorNotifAppState extends State<ColorNotifApp> {
  Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return new NotificationListener<ColorNotification>(
        onNotification: onColorNotif, child: getColorBoxes());
  }

  bool onColorNotif(ColorNotification notification) {
    setState(() => selectedColor = notification.color);
    return false; // arrête le *bubbling* de la notification
  }

  getColorBoxes() => new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Text(
            selectedColor?.toString() ?? 'Select a color',
            style: selectedColor == null
                ? textStyle
                : textStyle.copyWith(color: selectedColor),
          ),
          new Center(
              child: new Row(mainAxisSize: MainAxisSize.min, children: [
            new ColorBox(Colors.cyan),
            new ColorBox(Colors.deepOrange),
            new ColorBox(Colors.purple),
          ]))
        ],
      ));
}

class ColorBox extends StatelessWidget {
  final Color color;
  final ColorNotification notif;

  ColorBox(this.color) : notif = new ColorNotification(color);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.symmetric(horizontal: 20.0),
        child: new InkWell(
            onTap: () => notif.dispatch(context),
            child: new Container(
              color: color,
              width: 100.0,
              height: 100.0,
            )));
  }
}

class ColorNotification extends Notification {
  final Color color;
  ColorNotification(this.color);
}
