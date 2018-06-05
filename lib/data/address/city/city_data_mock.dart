import 'dart:async';
import 'dart:convert';
import 'package:app_mecanica/data/Address/city_data.dart';
import 'package:flutter/services.dart' show rootBundle;

class MockCityRepository implements CityRepository {
  @override
  Future<List<City>> fetch(){
    return rootBundle.loadString('assets/data/municipios.json')
        .then((dynamic res) {
      Map decoded = json.decode(res);
      final List items = decoded['data'];
      return items.map( (rawData) => new City.fromMap(rawData) ).toList();
    });
  }

  @override
  Future<List<City>> fetchByState(String uf) {
    return rootBundle.loadString('assets/data/municipios.json')
        .then((dynamic res) {
      Map decoded = json.decode(res);
      decoded.removeWhere((key, value) => key == 'Uf' && value == uf);
      final List items = decoded['data'];
      print(items);
      return items.map( (rawData) => new City.fromMap(rawData) ).toList();
    });
  }
  
}



