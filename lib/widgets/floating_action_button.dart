import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget floatingActionButtonIcon;
  final Function floatingActionButtonOnPressed;
  final String heroTag;
  const CustomFloatingActionButton({super.key, required this.floatingActionButtonIcon, required this.floatingActionButtonOnPressed, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      backgroundColor: Theme.of(context).primaryColor,
      child: floatingActionButtonIcon,
      onPressed: () {
        floatingActionButtonOnPressed();
      },
    );
  }
}