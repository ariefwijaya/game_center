import 'package:game_center/config/themes/theme_config.dart';
import 'package:game_center/widgets/design_system/button/button.dart';
import 'package:game_center/widgets/markdown_text.dart';
import 'package:flutter/material.dart';

class _SectionPlaceholderBuilder extends StatelessWidget {
  final Widget? icon;
  final String title;
  final TextStyle? Function(BuildContext context)? titleTextStyle;
  final TextStyle? Function(BuildContext context)? descriptionTextStyle;
  final String? description;
  final bool center;
  final bool inverted;
  final EdgeInsetsGeometry? padding;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final String? thirdButtonText;
  final VoidCallback? onPrimaryButtonTapped;
  final VoidCallback? onSecondaryButtonTapped;
  final VoidCallback? onThirdButtonTapped;
  const _SectionPlaceholderBuilder(
      {Key? key,
      this.icon,
      required this.title,
      this.description,
      this.titleTextStyle,
      this.descriptionTextStyle,
      this.center = true,
      this.padding,
      this.inverted = false,
      this.primaryButtonText,
      this.secondaryButtonText,
      this.thirdButtonText,
      this.onPrimaryButtonTapped,
      this.onSecondaryButtonTapped,
      this.onThirdButtonTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(24),
      child: center
          ? Center(
              child: _buildContent(context),
            )
          : _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) icon!,
        MarkdownText(
          text: title,
          textStyle: titleTextStyle?.call(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        if (description != null)
          Column(
            children: [
              MarkdownText(
                text: description!,
                textAlign: TextAlign.center,
                textStyle: descriptionTextStyle
                    ?.call(context)
                    ?.copyWith(color: Theme.of(context).subheadingColor),
              ),
              const SizedBox(height: 20),
            ],
          ),
        if (primaryButtonText != null && secondaryButtonText != null)
          const SizedBox(height: 60),
        _button(context)
      ],
    );
  }

  Widget _button(BuildContext context) {
    List<Widget> listButton = [
      if (primaryButtonText != null)
        FilledButton.medium(
            buttonText: primaryButtonText!, onPressed: onPrimaryButtonTapped),
      if (primaryButtonText != null && secondaryButtonText != null)
        const SizedBox(height: 12),
      if (secondaryButtonText != null)
        GhostButton.medium(
            colorType: ButtonColorType.secondary,
            buttonText: secondaryButtonText!,
            onPressed: onSecondaryButtonTapped),
    ];

    return Column(
      children: [
        Column(
          children: inverted ? listButton.reversed.toList() : listButton,
        ),
        if (thirdButtonText != null)
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: NudeButton.small(
                colorType: ButtonColorType.secondary,
                buttonText: thirdButtonText!,
                onPressed: onThirdButtonTapped),
          )
      ],
    );
  }
}

abstract class SectionPlaceholder {
  static Widget large(
      {Widget? icon,
      required String title,
      String? description,
      bool inverted = false,
      bool center = true,
      EdgeInsetsGeometry? padding,
      String? primaryButtonText,
      String? secondaryButtonText,
      String? thirdButtonText,
      VoidCallback? onPrimaryButtonTapped,
      VoidCallback? onSecondaryButtonTapped,
      VoidCallback? onThirdButtonTapped}) {
    return _SectionPlaceholderBuilder(
      title: title,
      description: description,
      icon: icon,
      center: center,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      thirdButtonText: thirdButtonText,
      inverted: inverted,
      onPrimaryButtonTapped: onPrimaryButtonTapped,
      onSecondaryButtonTapped: onSecondaryButtonTapped,
      onThirdButtonTapped: onThirdButtonTapped,
      padding: padding,
      titleTextStyle: (context) => Theme.of(context).textTheme.headline2,
      descriptionTextStyle: (context) => Theme.of(context).textTheme.bodyText1,
    );
  }

  static Widget medium(
      {Widget? icon,
      required String title,
      String? description,
      bool inverted = false,
      bool center = true,
      EdgeInsetsGeometry? padding,
      String? primaryButtonText,
      String? secondaryButtonText,
      String? thirdButtonText,
      VoidCallback? onPrimaryButtonTapped,
      VoidCallback? onSecondaryButtonTapped,
      VoidCallback? onThirdButtonTapped}) {
    return _SectionPlaceholderBuilder(
      title: title,
      description: description,
      icon: icon,
      center: center,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      thirdButtonText: thirdButtonText,
      inverted: inverted,
      onPrimaryButtonTapped: onPrimaryButtonTapped,
      onSecondaryButtonTapped: onSecondaryButtonTapped,
      onThirdButtonTapped: onThirdButtonTapped,
      padding: padding,
      titleTextStyle: (context) => Theme.of(context).textTheme.headline3,
      descriptionTextStyle: (context) => Theme.of(context).textTheme.bodyText2,
    );
  }

  static Widget small(
      {Widget? icon,
      required String title,
      String? description,
      bool inverted = false,
      bool center = true,
      EdgeInsetsGeometry? padding,
      String? primaryButtonText,
      String? secondaryButtonText,
      String? thirdButtonText,
      VoidCallback? onPrimaryButtonTapped,
      VoidCallback? onSecondaryButtonTapped,
      VoidCallback? onThirdButtonTapped}) {
    return _SectionPlaceholderBuilder(
      title: title,
      description: description,
      icon: icon,
      center: center,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      thirdButtonText: thirdButtonText,
      inverted: inverted,
      onPrimaryButtonTapped: onPrimaryButtonTapped,
      onSecondaryButtonTapped: onSecondaryButtonTapped,
      onThirdButtonTapped: onThirdButtonTapped,
      padding: padding,
      titleTextStyle: (context) => Theme.of(context).textTheme.headline4,
      descriptionTextStyle: (context) => Theme.of(context).textTheme.bodyText2,
    );
  }
}
