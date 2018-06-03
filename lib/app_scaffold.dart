import 'package:app_mecanica/consumer_screen.dart';
import 'package:app_mecanica/modules/consumer/consumer_page.dart';
import 'package:flutter/material.dart';

import 'package:app_mecanica/modules/consumer/consumer_view.dart';

class AppScaffold extends StatefulWidget {
  final Widget drawer;
  final Screen currentScreen;

  AppScaffold({Key key, this.drawer, this.currentScreen}) : super(key: key);

  @override
  _AppScaffoldState createState() => new _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: widget.currentScreen.appBar(context),
      body: widget.currentScreen.contentBuilder(context),
      drawer: widget.drawer,
    );
  }
}

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;
  final WidgetBuilder appBar;

  Screen({
    this.title,
    this.contentBuilder,
    this.appBar,
  });
}

final Screen osScreen = new Screen(
    title: 'Ordem de Serviço',
    contentBuilder: (BuildContext context) {
      return new Container();
    });

final Screen consumerScreen = new Screen(
    title: 'Clientes',
    appBar: (BuildContext context) {
      return new AppBar(
        title: new Text('Clientes'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {

            },
          ),
        ],
      );
    },
    contentBuilder: (BuildContext context) {
      return new Scaffold(
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ConsumerInfo.routeName);
            }),
        body: new ConsumerList(),
      );
    });
