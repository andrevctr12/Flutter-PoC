import 'dart:async';
import 'package:app_mecanica/data/consumer/consumer_data.dart';

class MockConsumerRepository implements ConsumerRepository{
  @override
  Future<List<Consumer>> fetch(){
    return new Future.value(kConsumers);
  }

}

var kConsumers = <Consumer>[
    new Consumer(
      nome: 'Romain Hoogmoed',
      email:'romain.hoogmoed@example.com'
    ),
    new Consumer(
      nome: 'Emilie Olsen',
      email:'emilie.olsen@example.com'
    )
];