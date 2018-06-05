import 'dart:async';

class Address {
  int id;
  String bairro;
  String rua;
  String cidade;
  String estado;
  String cep;
  String siglaUf;

  Address({
    this.id,
    this.bairro = '',
    this.rua = '',
    this.cidade = '',
    this.estado = '',
    this.cep = '',
    this.siglaUf = '',
  });

  Address.fromMap(Map<String, dynamic> map)
      : id = map['endereco']['id'],
        bairro = map['endereco']['bairro']['nome'],
        rua = map['endereco']['rua']['nomeRua'],
        cidade = map['endereco']['cidade']['nome'],
        cep = '${map['endereco']['cep']}',
        siglaUf = '${map['endereco']['cidade']['uf']['ufsigla']}',
        estado = map['endereco']['cidade']['uf']['nome'];
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
