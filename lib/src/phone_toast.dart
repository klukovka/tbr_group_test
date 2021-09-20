import 'package:flutter/material.dart';

class PhoneToast extends StatelessWidget {
  const PhoneToast(this._toastText, {Key? key}) : super(key: key);

  final String _toastText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: theme.primaryColor,
      ),
      child: Text(
        _toastText,
        style: theme.textTheme.headline5,
      ),
    );
  }
}
