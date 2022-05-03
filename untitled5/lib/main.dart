import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  bool _first = true;
  final animationWrapper = _AnimationWrapper(
      GlobalKey<_AnimationWrapperState>());
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('動畫範例'),
    );
    var btn = RaisedButton(
      child: Text('切換', style: TextStyle(fontSize: 18, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        animationWrapper.setIcon();
      },
    );
    final widget = Center(
      child: Container(
        child: Column(
          children: <Widget>[
            animationWrapper,
            Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}
class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  _AnimationWrapper(this._key): super (key: _key);
  @override
  State<StatefulWidget> createState() => _AnimationWrapperState();
  setIcon() {
    _key.currentState?.setIcon();
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  bool _first=true;
  @override
  Widget build(BuildContext context) {
    var w = Expanded(
      child:AnimatedCrossFade(
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 2),
        firstChild: const Text('Flutter動畫',style: TextStyle(fontSize: 30),),
        secondChild:const Icon(Icons.access_alarm,size: 100,),
        crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        alignment: Alignment.center,
      ),
    );
    return w;
  }
  setIcon(){
    setState(() {
      _first = !_first;
    });
  }
}

