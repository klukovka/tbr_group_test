import 'package:flutter/material.dart';

const _horizontalPadding = 24.0;
const _verticalPadding = 12.0;
const _circularRadius = 25.0;

class PhoneToast extends StatelessWidget {
  const PhoneToast(this._toastText, {Key? key}) : super(key: key);

  final String _toastText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: _verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_circularRadius),
        color: theme.primaryColor,
      ),
      child: Text(
        _toastText,
        style: theme.textTheme.headline5,
      ),
    );
  }
}
