import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {

  final Function(String) onDrawerItemSelected;
  final String selectedItemId;

  AppDrawer({
    this.onDrawerItemSelected,
    this.selectedItemId,
  });

  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final String _employeeName = 'Funcionário';
  final String _employeeEmail = 'funcionario@gmail.com';
  final String _employeeAbbr = 'F';

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: _buildDrawerList(context),
      ),
    );
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    List<Widget> children = [];
    children
      ..addAll([_buildUserAccount()])
      ..addAll(_buildDrawerItems(context))
      ..addAll([new Divider()])
      ..addAll(_buildSettingAndHelp());
    return children;
  }

  Widget _buildUserAccount() {
    return new UserAccountsDrawerHeader(
      accountName: new Text(_employeeName),
      accountEmail: new Text(_employeeEmail),
      currentAccountPicture: new CircleAvatar(
          backgroundColor: Colors.black54, child: new Text(_employeeAbbr)),
    );
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    return [
      new _DrawerItem(
        id: 'service',
        title: 'Ordem de Serviço',
        icon: new Icon(Icons.add_circle),
        isSelected: widget.selectedItemId == 'service',
        onDrawerItemSelected: widget.onDrawerItemSelected,
      ),
      new _DrawerItem(
        id: 'consumer',
        title: 'Clientes',
        icon: new Icon(Icons.contacts),
        isSelected: widget.selectedItemId == 'consumer',
        onDrawerItemSelected: widget.onDrawerItemSelected,
      ),
      new _DrawerItem(
        id: 'vehicles',
        title: 'Veículos',
        icon: new Icon(Icons.local_car_wash),
        isSelected: widget.selectedItemId == 'vehicles',
        onDrawerItemSelected: widget.onDrawerItemSelected,
      ),
    ];
  }

  List<Widget> _buildSettingAndHelp() {
    String settings = 'Configurações';
    String helpAndFeedBack = 'Ajuda & feedback';
    return [
      new _DrawerItem(
        id: 'settings',
        title: settings,
        icon: new Icon(Icons.settings),
        isSelected: widget.selectedItemId == 'settings',
        onDrawerItemSelected: widget.onDrawerItemSelected,
      ),
      new _DrawerItem(
        id: 'helpfeedback',
        title: helpAndFeedBack,
        icon: new Icon(Icons.help),
        isSelected: widget.selectedItemId == 'helpfeedback',
        onDrawerItemSelected: widget.onDrawerItemSelected,
      ),
    ];
  }
}

class _DrawerItem extends StatelessWidget {
  final String id;
  final Icon icon;
  final String title;
  final bool isSelected;
  final Function(String) onDrawerItemSelected;

  _DrawerItem(
      {this.id,
      this.icon,
      this.title,
      this.isSelected,
      this.onDrawerItemSelected});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: this.icon,
      title: new Text(
        this.title,
        style: new TextStyle(
          fontSize: 14.0,
        ),
      ),
      onTap: () {
        onDrawerItemSelected(this.id);
        Navigator.pop(context);
      },
      selected: isSelected,
    );
  }
}
