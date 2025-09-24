import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ohlcommonlib/ohlcommonlib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await OHLcommonlib.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ohlcommonlib example app'),
        ),
        body: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: new ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i)=> renderRow(i,context),
            ),
          ),
        ),
      ),
    );
  }

  void showAlert(String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: new Text("提示"),
            content: new Text(text),
            actions: <Widget>[
              new TextButton(
                child: new Text("OK"),
                onPressed: () {
                  // 关闭弹框
                  Navigator.of(context).pop();
                },
              )
            ]));
  }

  void showPrivacyAlert(String text, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: new Text("隐私协议"),
            content: new Text(text),
            actions: <Widget>[
              new TextButton(
                child: new Text("同意"),
                onPressed: () {
                  // 关闭弹框
                  Navigator.of(context).pop();
                  OHLcommonlib.submitPolicyGrantResult(true, null);
                },
              ),
              new TextButton(
                child: new Text("拒绝"),
                onPressed: () {
                  Navigator.of(context).pop();
                  OHLcommonlib.submitPolicyGrantResult(false, null);
                },
              )
            ]));
  }

  Widget renderRow(i, BuildContext context){
    return new Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 30,
        ),
        Text('Running on: $_platformVersion\n'),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: new TextButton(
            //color: Colors.blueGrey,
            //textColor: Colors.white,
            child: new Text('打开隐私协议弹框'),
            onPressed: (){
              showPrivacyAlert('是否同意隐私协议？',context);
            },
          ),
        ),
      ],
    );
  }
}

