import 'package:app_mecanica/data/consumer/consumer_data.dart';
import 'package:app_mecanica/modules/consumer/consumer_page.dart';
import 'package:flutter/material.dart';

import 'package:app_mecanica/modules/consumer/consumer_presenter.dart';

class ConsumerList extends StatefulWidget {
  ConsumerList({Key key}) : super(key: key);
  @override
  _ConsumerListState createState() => new _ConsumerListState();
}

class _ConsumerListState extends State<ConsumerList>
    implements ConsumerListViewContract {
  ConsumerListPresenter _presenter;
  List<Consumer> _consumers;
  bool _isLoading;

  _ConsumerListState() {
    _presenter = new ConsumerListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadConsumers();
  }

  @override
  void onLoadConsumersComplete(List<Consumer> items) {
    setState(() {
      _consumers = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadConsumersError() {
    // TODO: implement onLoadConsumersError
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (_isLoading) {
      widget = new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: new CircularProgressIndicator(),
        ),
      );
    } else {
      widget = new ListView(
        padding: new EdgeInsets.symmetric(vertical: 4.0),
        children: _buildConsumerList(),
      );
    }
    return widget;
  }

  List<_ConsumerListItem> _buildConsumerList() {
    return _consumers
        .map((consumer) => new _ConsumerListItem(
              consumer: consumer,
              onTap: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new ConsumerInfo(consumer: consumer),
                );
                Navigator.of(context).push(route);
              },
              context: context,
            ))
        .toList();
  }
}

class _ConsumerListItem extends ListTile {
  _ConsumerListItem(
      {Consumer consumer, GestureTapCallback onTap, BuildContext context})
      : super(
          title: new Text(consumer.nome),
          subtitle: new Text(consumer.email),
          leading: new CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: new Text(consumer.nome[0]),
          ),
          trailing: new Icon(Icons.navigate_next),
          onTap: onTap,
        );
}
