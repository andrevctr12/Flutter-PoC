import 'package:app_mecanica/data/address/address_data.dart';
import 'package:app_mecanica/data/consumer/consumer_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConsumerInfo extends StatefulWidget {
  static const String routeName = '/consumerinfo';

  final Consumer consumer;

  ConsumerInfo({
    Key key,
    this.consumer,
  }) : super(key: key);

  @override
  _ConsumerInfoState createState() => new _ConsumerInfoState();
}

class _ConsumerInfoState extends State<ConsumerInfo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _BrNumberTextInputFormatter _phoneNumberFormatter = new _BrNumberTextInputFormatter();

  bool _autovalidate = false;
  bool _formWasEdited = false;

  Consumer cliente;
  Address endereco;

  @override
  void initState() {
    super.initState();
    cliente = widget.consumer;
    endereco = widget.consumer.endereco;
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      //showInSnackBar('${person.name}\'s phone number is ${person.phoneNumber}');
    }
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  String _validatePhoneNumber(String value) {
    _formWasEdited = true;
    final RegExp phoneExp = new RegExp(r'^\(\d\d\) \d\d\d\d\d\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(##) ######### - Digite um número válido.';
    return null;
  }

  var _editIcon = new Icon(Icons.edit);
  static const _spaceBetween = 4.0;
  static const _spaceBetweenAddress = 2.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.consumer.nome),
        actions: <Widget>[
          new GestureDetector(
            child: _editIcon,
            onTap: () {
              showInSnackBar("Lalalala");
              setState(() {
                //_editIcon = new Icon(Icons.done);
              });
            },
          ),
        ],
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          //onWillPop: _warnUserAboutInvalidData,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 10.0),
                new TextFormField(
                  initialValue: cliente.nome,
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.person),
                    labelText: 'Nome Completo',
                  ),
                  onSaved: (String value) => cliente.nome = value,
                  validator: _validateName,
                ),
                const SizedBox(height: _spaceBetween),
                new TextFormField(
                  initialValue: cliente.cpf,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.info),
                    labelText: 'CPF',
                  ),
                  onSaved: (String value) => cliente.cpf = value,
                  //validator: _validateCPF, //TODO validate CPF
                ),
                const SizedBox(height: _spaceBetween),
                new TextFormField(
                  initialValue: cliente.email,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  onSaved: (String value) => cliente.email = value,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: _spaceBetween),
                new TextFormField(
                  initialValue: cliente.telefone,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.phone),
                    labelText: 'Telefone',
                  ),
                  onSaved: (String value) => cliente.telefone = value,
                  keyboardType: TextInputType.phone,
                  validator: _validatePhoneNumber,
                  inputFormatters: <TextInputFormatter> [
                    WhitelistingTextInputFormatter.digitsOnly,
                    // Fit the validating format,
                    //_phoneNumberFormatter, //TODO: FORMATTER
                  ],
                ),
                const SizedBox(height: _spaceBetween),
                new TextFormField(
                  initialValue: cliente.endereco.rua,
                  decoration: new InputDecoration(
                    icon: const Icon(Icons.pin_drop),
                    labelText: 'Endereço',
                  ),
                  onSaved: (String value) => cliente.endereco.rua = value,
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 42.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: _spaceBetweenAddress),
                      new TextFormField(
                        initialValue: cliente.numero == null ? '' : '${cliente.numero}' ,
                        decoration: new InputDecoration(
                          labelText: 'Número',
                        ),
                        //onSaved: (String value) => cliente.numero = value,
                      ),
                      const SizedBox(height: _spaceBetweenAddress),
                      new TextFormField(
                        initialValue: cliente.endereco.bairro,
                        decoration: new InputDecoration(
                          labelText: 'Bairro',
                        ),
                        onSaved: (String value) => cliente.endereco.bairro = value,
                      ),
                      const SizedBox(height: _spaceBetweenAddress),
                      new TextFormField(
                        initialValue: cliente.endereco.cidade,
                        decoration: new InputDecoration(
                          labelText: 'Cidade',
                        ),
                        onSaved: (String value) => cliente.endereco.cidade = value,
                      ),
                      const SizedBox(height: _spaceBetweenAddress),
                      new TextFormField(
                        initialValue: cliente.endereco.estado,
                        decoration: new InputDecoration(
                          labelText: 'Estado',
                        ),
                        onSaved: (String value) => cliente.endereco.estado = value,
                      ),
                    ],
                  ),
                ),
                //Final do momentum
                const SizedBox(height: 36.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTileForm({
    Icon icon,
    String initialValue,
    bool enabled = false,
    String hintText,
    List<TextInputFormatter> inputFromatters,
    bool isAddress = false,
    String labelText,
    FormFieldSetter<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
    FormFieldValidator<String> validator,
  }) {
    var paddingLeft = isAddress ? 40.0 : 0.0;
    return <SingleChildRenderObjectWidget>[
      const SizedBox(height: 16.0),
      new Padding(
        padding: new EdgeInsets.only(left: paddingLeft),
        child: new TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          decoration: new InputDecoration(
            border: UnderlineInputBorder(),
            hintText: hintText,
            icon: icon,
            labelText: labelText,
          ),
          inputFormatters: inputFromatters,
          onSaved: onSaved,
          keyboardType: keyboardType,
          validator: validator,
        ),
      ),
    ];
  }
}

class _BrNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    } else if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    } else if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    else if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

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
                          decoration: new InputDecoration(hintText: 'Número'),
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
