import 'package:app_mecanica/app_drawer.dart';
import 'package:app_mecanica/consumer_screen.dart';
import 'package:app_mecanica/modules/consumer/consumer_view.dart';
import 'package:flutter/material.dart';

import 'package:app_mecanica/app_scaffold.dart';
import 'package:app_mecanica/injection/dependency_injection.dart';

void main() {
  Injector.configure(Flavor.PRO);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  var _routes = <String, WidgetBuilder>{
    ConsumerPage.routeName: (BuildContext context) => new ConsumerPage(),
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.indigo,
        primaryColorLight: Colors.indigo[100],
        primaryColorDark: Colors.indigo[700],
        accentColor: Colors.pinkAccent,
      ),
      home: new HomeScreen(),
      routes: _routes,
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  var activeScreen = consumerScreen;
  var selectedMenuItemId = 'costumer';

  final Screen _falseScreen = new Screen(
    title: 'Em Implementação',
    appBar: (BuildContext context) {
      return new AppBar(
        title: new Text('Em Implementação'),
      );
    },
    contentBuilder: (BuildContext context) {
      return new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: new CircularProgressIndicator(),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return new AppScaffold(
      drawer: new AppDrawer(
        selectedItemId: selectedMenuItemId,
        onDrawerItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          switch (itemId) {
            case 'service':
              setState(() => activeScreen = _falseScreen);
              break;
            case 'consumer':
              setState(() => activeScreen = consumerScreen);
              break;
            default:
              setState(() => activeScreen = _falseScreen);
          }
        },
      ),
      currentScreen: activeScreen,
    );
  }
}
