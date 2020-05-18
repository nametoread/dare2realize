import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './d2r/d2r.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoHeader(),
      body: D2R(),
    );
  }

  Widget logoHeader() => AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/d2r/trans_1x.png',
              fit: BoxFit.cover,
              scale: 1.8,
            ),
          ],
        ),
        backgroundColor: CupertinoColors.white,
      );
}
