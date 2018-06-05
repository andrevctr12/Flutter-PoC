import 'dart:async';

class State {
  int id;
  String codigoUf;
  String nome;
  String uf;

  State({
    this.id,
    this.codigoUf,
    this.nome,
    this.uf,
  });

  State.fromMap(Map<String, dynamic> map)
      : id = map['Id'],
        codigoUf = map['CodigoUf'],
        nome = map['Nome'],
        uf = map['Uf'];
}

abstract class StateRepository {
  Future<List<State>> fetch();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
