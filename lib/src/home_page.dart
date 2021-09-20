import 'package:flutter/material.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  late final MaskInputFormatter _formatter;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController()..text = "";
    _formatter = new MaskInputFormatter(mask: '(###) ###-####');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _headLineText(theme),
            _formatedField(theme),
          ],
        ),
      ),
      floatingActionButton: _sendButton(theme),
    );
  }

  Widget _headLineText(ThemeData theme) {
    return Text(
      'Get started',
      style: theme.textTheme.headline1,
    );
  }

  Widget? _clearButton(Color color) {
    if (_compareControllerLength(0)) {
      return IconButton(
        icon: Icon(
          Icons.clear_rounded,
          color: color,
        ),
        onPressed: () {
          setState(() {
            _controller.clear();
          });
        },
      );
    }
  }

  bool _compareControllerLength(int length) {
    return _controller.text.length != length;
  }

  Widget _formatedField(ThemeData theme) {
    return TextField(
        inputFormatters: [_formatter],
        controller: _controller,
        style: theme.textTheme.headline4,
        keyboardType: TextInputType.number,
        cursorColor: theme.primaryColor,
        cursorHeight: 32,
        cursorWidth: 1.5,
        textAlignVertical: TextAlignVertical.center,
        autofocus: true,
        decoration: InputDecoration(
          helperText: 'Enter your phone number',
          helperStyle: theme.textTheme.headline3,
          hintText: '(201) 555-0123',
          hintStyle: theme.textTheme.headline2,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColorDark),
          ),
          focusColor: theme.primaryColorDark,
          suffixIcon: _clearButton(theme.primaryColor),
        ),
        onChanged: _onCahngeValue);
  }

  void _onCahngeValue(String value) {
    setState(() {});
  }

  Widget _sendButton(ThemeData theme) {
    return FloatingActionButton(
      onPressed: _compareControllerLength(14) ? null : () {},
      child: Icon(Icons.arrow_right_alt),
      elevation: 0,
      backgroundColor: _compareControllerLength(14)
          ? theme.primaryColorLight
          : theme.accentColor,
    );
  }
}
