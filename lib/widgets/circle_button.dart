import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key? key,
      this.onPressed,
      required this.child,
      this.useOutline = false,
      this.elevation = 2,
      this.color = Colors.white,
      this.outlineColor})
      : super(key: key);
  final VoidCallback? onPressed;
  final Widget child;
  final double elevation;
  final Color color;
  final Color? outlineColor;
  final bool useOutline;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      color: onPressed == null ? Theme.of(context).disabledColor : color,
      shape: CircleBorder(
          side: useOutline
              ? BorderSide(
                  color: onPressed == null
                      ? Theme.of(context).disabledColor
                      : outlineColor ?? color,
                )
              : BorderSide.none),
      elevation: elevation,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(padding: const EdgeInsets.all(3.0), child: child),
      ),
    );
  }
}
