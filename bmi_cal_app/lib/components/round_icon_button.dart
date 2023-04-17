import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.iconColor, this.onPressed});
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onPressed;
  // final void Function()? onpressed ;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: iconColor,
      ),
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xffdfdcb9),
    );
  }
}