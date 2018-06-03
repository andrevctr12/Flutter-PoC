import 'dart:async';

import 'package:app_mecanica/data/address/address_data.dart';

//class Phone {
//  int ddd;
//  String numero;
//
//  Phone({
//    this.ddd,
//    this.numero,
//  });
//
//  Phone.fromMap(Map<String, dynamic> map)
//      : ddd = ,
//        numero = ;
//}

class Consumer {
  int id = null;
  String nome;
  String cpf;
  String telefone;
  String email;
  Address endereco;
  String complemento;
  int numero;
  int ddd;


  Consumer({
    this.id = 0,
    this.nome = '',
    this.cpf = '',
    this.ddd,
    this.telefone = '',
    this.email = '',
    this.endereco,
    this.complemento = '',
    this.numero,
  }) {
    endereco = new Address();
  }

  Consumer.fromMapOld(Map<String, dynamic> map)
      : nome = "${map['name']['first']} ${map['name']['last']}",
        email = map['email'];

  Consumer.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        cpf = map['cpf'],
        ddd = map['telCliente']['ddd'],
        telefone = '${map['telCliente']['telefone']}',
        email = map['email'] != null ? map['email'] : '',
        endereco = new Address.fromMap(map),
        complemento = map['complemento'],
        numero = map['end_num'];

  Consumer.fromMapMin(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        email = map['email'];
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
