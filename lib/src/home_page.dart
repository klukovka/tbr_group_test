import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_input_formatter/mask_input_formatter.dart';
import 'package:tbr_group_test/src/phone_toast.dart';

const _horizontalPadding = 20.0;
const _verticalPadding = 60.0;
const _emptyController = 0;
const _fullController = 14;
const _cursorHeight = 32.0;
const _cursorWidth = 1.5;
const _sendButtonElevation = 0.0;
const _toastDuration = 2;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  late final MaskInputFormatter _formatter;
  late final FToast _toast;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController()..text = "";
    _formatter = new MaskInputFormatter(mask: '(###) ###-####');
    _toast = new FToast()..init(context);
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
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
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
        cursorHeight: _cursorHeight,
        cursorWidth: _cursorWidth,
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

  Widget? _clearButton(Color color) {
    if (_compareControllerLength(_emptyController)) {
      return IconButton(
        icon: Icon(
          Icons.cancel,
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

  void _onCahngeValue(String value) {
    setState(() {});
  }

  Widget _sendButton(ThemeData theme) {
    if (_compareControllerLength(_fullController)) {
      return FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_forward),
        elevation: _sendButtonElevation,
        backgroundColor: theme.primaryColorLight,
      );
    } else {
      return FloatingActionButton(
        onPressed: () {
          _toast.showToast(
            child: PhoneToast(_controller.text),
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: _toastDuration),
          );
          print(_controller.text);
        },
        child: Icon(Icons.arrow_forward),
        elevation: _sendButtonElevation,
        backgroundColor: theme.accentColor,
      );
    }
  }
}
