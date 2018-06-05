import 'dart:async';
import 'dart:convert';
import 'package:app_mecanica/data/Address/state_data.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockStateRepository implements StateRepository {
  @override
  Future<List<State>> fetch(){
    return rootBundle.loadString('assets/data/estados.json')
        .then((dynamic res) {
      Map decoded = json.decode(res);
      final List items = decoded['data'];
      return items.map( (rawData) => new State.fromMap(rawData) ).toList();
    });
  }
}



