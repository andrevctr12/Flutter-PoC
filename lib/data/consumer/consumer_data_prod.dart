import 'dart:async';

import 'package:app_mecanica/data/consumer/consumer_data.dart';
import 'package:app_mecanica/utils/network_util.dart';

class ProdConsumerRepository implements ConsumerRepository {
  NetworkUtil _netUtil = new NetworkUtil();
  static final _kUserUrl = 'https://oficinamecanica.herokuapp.com/cliente';

  @override
  Future<List<Consumer>> fetch(){
    return _netUtil.get(_kUserUrl).then((dynamic res) {
      return res.map( (rawData) => Consumer.fromMap(rawData) ).toList();
    });
  }


}

