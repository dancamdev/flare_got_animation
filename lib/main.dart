import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game of Thrones',
      home: MyHomePage(title: 'GoT Flare Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlareControls _controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlareActor(
                'assets/got.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Scroll",
                controller: _controls,
              ),
            ),
            RaisedButton(
              color: Colors.black87,
              child: Text('start!', style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  _controls.play('Scroll');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
