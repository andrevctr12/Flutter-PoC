import 'dart:async';

import 'package:app_mecanica/data/address/address_data.dart';

class Consumer {
  int id;
  String nome;
  String CPF;
  String telefone;
  List<String> email;
  Address endereco;
  String complemento;
  int numero;

  Consumer({
    this.id,
    this.nome,
    this.CPF,
    this.telefone,
    this.email,
    this.endereco,
    this.complemento,
    this.numero,
  });

  Consumer.fromMapOld(Map<String, dynamic> map)
      : nome = "${map['name']['first']} ${map['name']['last']}",
        telefone = map['phone'];

  Consumer.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        CPF = map['cpf'],
        telefone = '(${map['telCliente']['ddd']}) ${map['telCliente']['telefone']}';
}

abstract class ConsumerRepository {
  Future<List<Consumer>> fetch();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
