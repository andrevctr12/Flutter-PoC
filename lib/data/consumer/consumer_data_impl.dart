import 'dart:async';
import 'package:app_mecanica/utils/network_util.dart';

import 'package:app_mecanica/data/consumer/consumer_data.dart';

class RandomConsumerRepository implements ConsumerRepository {
  
  NetworkUtil _netUtil = new NetworkUtil();
  static final _kRandomUserUrl = 'http://api.randomuser.me/?results=15';

  @override
  Future<List<Consumer>> fetch(){
    return _netUtil.get(_kRandomUserUrl).then((dynamic res) {
      final List items = res['results'];
      return items.map( (rawData) => new Consumer.fromMapOld(rawData) ).toList();
    });
  }
}