import 'package:flutter/material.dart';

import 'enum.dart';

class _GhostButtonBuilder extends StatelessWidget {
  const _GhostButtonBuilder(
      {Key? key,
      required this.buttonText,
      required this.infiniteWidth,
      this.onPressed,
      this.height,
      this.enabled = true,
      this.isLoading = false,
      this.suffixIcon,
      this.prefixIcon,
      this.centeredSuffixIcon = false,
      this.centeredPrefixIcon = false,
      this.fontSize,
      this.colorType = ButtonColorType.primary})
      : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;
  final double? height;
  final bool infiniteWidth;
  final bool enabled;
  final bool isLoading;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool centeredSuffixIcon;
  final bool centeredPrefixIcon;
  final double? fontSize;
  final ButtonColorType colorType;

  @override
  Widget build(BuildContext context) {
    late Color _color;

    if (colorType == ButtonColorType.primary) {
      _color = Theme.of(context).primaryColor;
    } else if (colorType == ButtonColorType.secondary) {
      _color = Theme.of(context).primaryColorDark;
    } else {
      //tertiary
      _color = Theme.of(context).scaffoldBackgroundColor;
    }

    return OutlinedButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(_color.withOpacity(0.1)),
            textStyle: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.disabled)
                    ? Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(fontSize: fontSize)
                    : Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(fontSize: fontSize)),
            side: MaterialStateProperty.resolveWith((states) => (states.contains(MaterialState.disabled))
                ? BorderSide(width: 3, color: Theme.of(context).disabledColor)
                : BorderSide(width: 3, color: _color)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.disabled) ? Theme.of(context).primaryColorLight.withOpacity(0.5) : _color),
            elevation: MaterialStateProperty.all(0),
            minimumSize: height != null ? MaterialStateProperty.all(infiniteWidth ? Size.fromHeight(height!) : Size(0, height!)) : null),
        onPressed: !enabled
            ? null
            : isLoading
                ? () {}
                : onPressed,
        child: _buttonChild(context, color: _color));
  }

  Widget _buttonChild(BuildContext context, {Color? color}) {
    String _buttonText = buttonText.toUpperCase();
    Widget _widgetText = Text(_buttonText);

    Widget _buttonChild = _widgetText;

    if (isLoading) {
      _buttonChild = SizedBox(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(color: color),
      ));
    } else if (suffixIcon != null) {
      _buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (centeredSuffixIcon)
            Flexible(child: _widgetText)
          else
            Expanded(child: _widgetText),
          const SizedBox(width: 10),
          if (suffixIcon != null) suffixIcon!
        ],
      );
    } else if (prefixIcon != null) {
      _buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon!,
          const SizedBox(width: 10),
          if (centeredPrefixIcon)
            Flexible(child: _widgetText)
          else
            Expanded(child: _widgetText),
        ],
      );
    }

    return _buttonChild;
  }
}

/// Filled button wrapper to build spesific button type within Filled Button.
/// Please refer to components page in Figma Design
class GhostButton {
  GhostButton._();

  /// return GhostButton in a Large size
  static Widget large(
      {Key? key,
      required String buttonText,
      VoidCallback? onPressed,
      bool infiniteWidth = true,
      bool enabled = true,
      bool isLoading = false,
      double fontSize = 18,
      Widget? suffixIcon,
      bool centeredSuffixIcon = true,
      Widget? prefixIcon,
      bool centeredPrefixIcon = true,
      ButtonColorType colorType = ButtonColorType.primary}) {
    return _GhostButtonBuilder(
        buttonText: buttonText,
        onPressed: onPressed,
        height: 56,
        infiniteWidth: infiniteWidth,
        enabled: enabled,
        isLoading: isLoading,
        colorType: colorType,
        suffixIcon: suffixIcon,
        centeredSuffixIcon: centeredSuffixIcon,
        prefixIcon: prefixIcon,
        centeredPrefixIcon: centeredPrefixIcon,
        fontSize: fontSize);
  }

  /// return GhostButton in a Medium size
  static Widget medium(
      {Key? key,
      required String buttonText,
      VoidCallback? onPressed,
      bool infiniteWidth = true,
      bool enabled = true,
      bool useElevation = false,
      bool isLoading = false,
      double fontSize = 14,
      Widget? suffixIcon,
      bool centeredSuffixIcon = true,
      Widget? prefixIcon,
      bool centeredPrefixIcon = true,
      ButtonColorType colorType = ButtonColorType.primary}) {
    return _GhostButtonBuilder(
        buttonText: buttonText,
        suffixIcon: suffixIcon,
        onPressed: onPressed,
        height: 44,
        infiniteWidth: infiniteWidth,
        enabled: enabled,
        isLoading: isLoading,
        fontSize: fontSize,
        prefixIcon: prefixIcon,
        colorType: colorType,
        centeredPrefixIcon: centeredPrefixIcon);
  }

  /// return GhostButton in a Small size
  static Widget small(
      {Key? key,
      required String buttonText,
      VoidCallback? onPressed,
      bool infiniteWidth = true,
      bool enabled = true,
      bool isLoading = false,
      double fontSize = 12,
      Widget? suffixIcon,
      bool centeredSuffixIcon = true,
      Widget? prefixIcon,
      bool centeredPrefixIcon = true,
      ButtonColorType colorType = ButtonColorType.primary}) {
    return _GhostButtonBuilder(
        buttonText: buttonText,
        onPressed: onPressed,
        height: 28,
        infiniteWidth: infiniteWidth,
        enabled: enabled,
        isLoading: isLoading,
        fontSize: fontSize,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        centeredPrefixIcon: centeredPrefixIcon,
        centeredSuffixIcon: centeredSuffixIcon,
        colorType: colorType);
  }
}
