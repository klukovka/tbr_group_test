import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController()..text = "";
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
            Text(
              'Get started',
              style: theme.textTheme.headline1,
            ),
            TextField(
              controller: _controller,
              style: theme.textTheme.headline4,
              keyboardType: TextInputType.phone,
              cursorColor:theme.primaryColor ,
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
                
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
