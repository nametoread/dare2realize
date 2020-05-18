import 'dart:math';
import 'dart:convert';

import 'package:flutter/services.dart';

enum wordType { adjective, adverb, noun, preposition, verb }

class Generator {
  // originally, written in python 3x
  static Map<wordType, List<String>> dict = new Map();

  Future<String> getFileData(String path) async =>
      await rootBundle.loadString(path);

  List<String> getJSON(String data) =>
      List<String>.from(json.decode(data).map((x) => x));

  Generator() {
    var temp;

    wordType.values.forEach((type) async {
      temp = await getFileData('assets/dics/' +
          type.toString().replaceAll('wordType.', '') +
          's.json');
      dict[type] = getJSON(temp).toList();
    });
  }

  String getWord(wordType type) =>
      dict[type][Random().nextInt(dict[type].length)];

  String _sentenceParody() {
    return [
      getWord(wordType.noun),
      getWord(wordType.verb),
      getWord(wordType.preposition),
      getWord(wordType.noun),
    ].join(' ');
  }

  String _phraseParody() {
    return [
      getWord(wordType.adverb),
      getWord(wordType.adjective),
      getWord(wordType.noun),
    ].join(' ');
  }

  String flipNikel() =>
      Random().nextBool() ? _sentenceParody() : _phraseParody();
}
