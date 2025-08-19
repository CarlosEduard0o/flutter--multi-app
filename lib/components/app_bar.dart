import 'package:flutter/material.dart';

AppBar appBar({
  Widget? leading,
  String title = '',
  Color? backgroundColor,
  Color? foregroundColor,
  List<Widget>? actions,
  required BuildContext context,
}) {
  return AppBar(
    leading: leading,
    foregroundColor: foregroundColor ?? Colors.white,
    backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
    title: Text(title),
    actions: actions,
  );
}
