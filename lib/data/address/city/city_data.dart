import 'dart:async';

class City {
  int id;
  int codigo;
  String nome;
  String uf;

  City({
    this.id,
    this.codigo,
    this.nome,
    this.uf,
  });

  City.fromMap(Map<String, dynamic> map)
      : id = map['Id'],
        codigo = map['codigo'],
        nome = map['Nome'],
        uf = map['Uf'];
}

abstract class CityRepository {
  Future<List<City>> fetch();
  Future<List<City>> fetchByState(String uf);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
