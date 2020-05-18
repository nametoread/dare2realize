import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './palette.dart';
import './generator.dart';

class D2R extends StatefulWidget {
  D2R({Key key}) : super(key: key);

  @override
  _D2RState createState() => _D2RState();
}

class _D2RState extends State<D2R> {
  static final Generator gnr = new Generator();

  static Align itemWrapper({String text, TextStyle textStyle}) => Align(
      child: Text(text.toUpperCase(),
          style: textStyle, maxLines: 1, overflow: TextOverflow.ellipsis));

  static Align _placeholder = itemWrapper(
    text: 'wanna some ideas?',
    textStyle: TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.bold,
      color: CupertinoColors.lightBackgroundGray,
    ),
  );

  List<Align> _pickerList = [_placeholder];

  static var scrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: Palette.getRandomGradient(),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 2, child: itemsPicker()),
            Expanded(flex: 1, child: genButton()),
          ],
        ),
      );

  void _fetchPicker() {
    setState(() {
      var nextItem = itemWrapper(
        text: gnr.flipNikel(),
        textStyle: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.normal,
          color: CupertinoColors.darkBackgroundGray,
        ),
      );

      if (_pickerList.first == _placeholder) {
        _pickerList.first = nextItem;
      } else {
        _pickerList.add(nextItem);
      }

      // okay, hold on a second, let me explain.
      // as you can see, overall quality of this
      // code is not very high. however, chunk
      // below seems extraordinary stupid. i do
      // agree with you.
      // but, this bug is know at least from
      // year 2017 (so 3 year from now). and as
      // far as my whole night research can tell,
      // this is maybe the most simple, yet
      // functional workaround written by me.
      scrollController.jumpTo(scrollController.offset - 0.1);

      scrollController.animateToItem(
        _pickerList.length - 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  Widget itemsPicker() => CupertinoPicker.builder(
        scrollController: scrollController,
        itemExtent: 100,
        onSelectedItemChanged: (index) {
          print(index);
        },
        itemBuilder: (context, index) {
          return _pickerList[index];
        },
        childCount: _pickerList.length,
      );

  Widget genButton() => FlatButton(
        color: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: _fetchPicker,
        child: Text(
          'generate',
          style: TextStyle(
            color: CupertinoColors.darkBackgroundGray.withOpacity(0.8),
            fontSize: 30.0,
            fontFamily: 'Press Start 2P',
          ),
        ),
      );
}
