import 'dart:async';

class Address {
  int id;
  String bairro;
  String rua;
  String cidade;
  String estado;
  String CEP;

  Address({
    this.id,
    this.bairro,
    this.rua,
    this.cidade,
    this.estado,
    this.CEP,
  });

//  Consumer.fromMap(Map<String, dynamic> map)
//      : fullName = "${map['name']['first']} ${map['name']['last']}",
//        phone = map['phone'];
}

abstract class AddressRepository {
  Future<List<Address>> fetch();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
