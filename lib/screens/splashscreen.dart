import 'package:flutter/material.dart';
// ignore: directives_ordering
import 'dart:async' show Timer;

import 'note_list.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;

  void handleTimeOut() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => new NoteList()));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, handleTimeOut);
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2200));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                          height: 100,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://media.giphy.com/media/eMUcrIszB83e9qigiZ/giphy.gif"),
                        backgroundColor: Colors.red,
                        radius: 80.0,
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 150,
                        ),
                      ),
                      Center(
                        child: Text(
                          "NOTES APP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 33.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(backgroundColor: Colors.red),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 15.0)),
                    Text(
                      "  CREATED BY\nU r name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}