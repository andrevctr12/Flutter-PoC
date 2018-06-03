import 'dart:async';

class Address {
  int id;
  String bairro;
  String rua;
  String cidade;
  String estado;
  String CEP;

  Address({
    this.id = 0,
    this.bairro = '',
    this.rua = '',
    this.cidade = '',
    this.estado = '',
    this.CEP = '',
  });

  Address.fromMap(Map<String, dynamic> map)
      : id = map['endereco']['id'],
        bairro = map['endereco']['bairro']['nome'],
        rua = map['endereco']['rua']['nomeRua'],
        cidade = map['endereco']['cidade']['nome'],
        estado = map['endereco']['cidade']['uf']['nome'],
        CEP = '${map['endereco']['cep']}';
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
