import 'package:flutter/material.dart';

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => new _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(
      text: 'LEFT',
      icon: new Icon(Icons.add),
      ),
        new Tab(
      text: 'RIGHT',
      icon: new Icon(Icons.add),
      ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: false,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Ordem de Serviço"),
          backgroundColor: Colors.deepOrange,
          // bottom: new TabBar(
          //   controller: _tabController,
          //   tabs: myTabs,
          // ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            // new first.FirstPage(),
            // new second.SecondPage(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.deepOrange,
          child: new TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
      ),
    );
  }
}
