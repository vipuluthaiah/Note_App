import 'package:Note_App/screens/box.dart';
import 'package:flutter/material.dart';
// ignore: directives_ordering
import 'dart:async' show Timer;

import 'note_list.dart';
//You can further custom this splash screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  CurvedAnimation _iconAnimation;

  void handleTimeOut() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => new NoteList()));
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
              color: Colors.white,
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
                          height: 400,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 220,
                          height: 220,
                          padding: EdgeInsets.all(8),
                          decoration: nMbox,
                          child: Container(
                            decoration: nMbox,
                            padding: EdgeInsets.all(3),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      // image: AssetImage('assets/avatar.JPG'),
                                      image: new NetworkImage(
                                          "https://i.imgur.com/UDal7nk.png")),
                                ),
                              ),
                            ),
                          ),
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
                    const CircularProgressIndicator(
                        backgroundColor: Colors.red),
                    Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 15.0)),
                    Text(
                      "  ",
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
