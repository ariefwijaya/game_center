import 'package:game_center/widgets/design_system/typography/typography.dart';
import 'package:flutter/material.dart';

class GhostField extends StatefulWidget {
  final String? Function(String? val)? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? enabled;
  final bool readOnly;
  final void Function(String? val)? onSaved;
  final Function(dynamic val)? onChanged;
  final TextInputType? keyboardType;
  final String? label;
  final String? description;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final int? maxLines;
  final TextAlign textAlign;
  final bool useSeparation;

  /// this will enable counter message
  final int? maxLength;

  const GhostField(
      {Key? key,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.initialValue,
      this.controller,
      this.enabled,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.maxLines = 1,
      this.label,
      this.description,
      this.textAlign = TextAlign.start,
      this.hint,
      this.maxLength,
      this.useSeparation = false})
      : super(key: key);

  @override
  State<GhostField> createState() => _GhostFieldState();
}

class _GhostFieldState extends State<GhostField> {
  TextEditingController? controller;
  String? errorMessage;
  int _currentLength = 0;

  @override
  void initState() {
    controller = widget.controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.label != null)
                    Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: TypographyCustom.subheading.bold(widget.label!)),
                  if (widget.description != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: TypographyCustom.subheading.bold(
                          widget.description!,
                          color: Theme.of(context).disabledColor),
                    ),
                ],
              ),
            ),
            if (widget.maxLength != null)
              TypographyCustom.subheading
                  .medium("$_currentLength/${widget.maxLength}")
          ],
        ),
        TextFormField(
          onChanged: (value) {
            setState(() {
              _currentLength = value.length;
            });
            widget.onChanged?.call(value);
          },
          onTap: widget.onTap,
          validator: widget.validator != null
              ? (val) {
                  setState(() {
                    errorMessage = widget.validator?.call(val);
                  });
                  return errorMessage;
                }
              : null,
          initialValue: widget.initialValue,
          controller: controller,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          onSaved: widget.onSaved,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).disabledColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColorDark)),
            counterStyle: Theme.of(context).textTheme.caption,
            errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).errorColor),
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.w500),
            prefixIcon: widget.prefixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.prefixIcon!,
                      if (widget.useSeparation)
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 1,
                            height: 24,
                            color: Theme.of(context).disabledColor)
                    ],
                  )
                : null,
            suffixIcon: widget.suffixIcon,
          ),
        ),
        if (errorMessage != null)
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 6),
              child: TypographyCustom.subheading
                  .bold(errorMessage!, color: Theme.of(context).errorColor))
      ],
    );
  }
}
