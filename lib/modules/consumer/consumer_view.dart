import 'package:app_mecanica/data/consumer/consumer_data.dart';
import 'package:flutter/material.dart';

import 'package:app_mecanica/modules/consumer/consumer_presenter.dart';

class ConsumerPage extends StatelessWidget {
  static const String routeName = '/consumerpage';

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Adicionar Cliente'),
          ),
          bottomNavigationBar: new Material(
            type: MaterialType.card,
            child: new MaterialButton(
                color: Theme.of(context).buttonColor,
                child: new Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: new Text(
                    'Adicionar',
                    style: new TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ),
                onPressed: () {}),
          ),
          body: new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new Flexible(
                  child: new ListTile(
                    leading: new Icon(Icons.person),
                    title: new TextFormField(
                      decoration:
                          new InputDecoration(hintText: 'Nome Completo'),
                    ),
                  ),
                ),
                new Flexible(
                    child: new ListTile(
                      leading: new Icon(Icons.phone),
                      title: new TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(hintText: 'Telefone'),
                      ),
                      trailing: new Icon(Icons.add_circle),
                    ),
                ),
                new Flexible(
                  child: new ListTile(
                    leading: new Icon(Icons.email),
                    title: new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(hintText: 'Email'),
                    ),
                    trailing: new Icon(Icons.add_circle),
                  ),
                ),
                new Flexible(
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: new Text(
                      'Endereço:',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Flexible(
                      child: new ListTile(
                        title: new TextFormField(
                          decoration:
                              new InputDecoration(hintText: 'Lougradouro'),
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new ListTile(
                        title: new TextFormField(
                          decoration:
                              new InputDecoration(hintText: 'Lougradouro'),
                        ),
                      ),
                    ),
                    new Flexible(
                      child: new ListTile(
                        title: new TextFormField(
                          decoration:
                          new InputDecoration(hintText: 'Número'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

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
              onTap: () {},
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
          subtitle: new Text(consumer.telefone.toString()),
          leading: new CircleAvatar(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: new Text(consumer.nome[0]),
          ),
          trailing: new Icon(Icons.navigate_next),
          onTap: onTap,
        );
}
