import 'package:flutter/material.dart';

class NeoBrutalismIconButton extends StatelessWidget {
  const NeoBrutalismIconButton(
      {super.key,
      required this.icon,
      this.backgroundColor = Colors.white,
      required this.onTap});
  final Widget icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 33,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(color: Colors.black, offset: Offset(4, 4))
            ]),
        child: icon,
      ),
    );
  }
}
