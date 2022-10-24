import 'package:game_center/main.import.dart';

class _BodyTextBuilder extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  const _BodyTextBuilder(this.data,
      {Key? key,
      required this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.maxLines,
      this.overflow = TextOverflow.ellipsis,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class BodyText {
  Widget body1Bold(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget body2Bold(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget body1Medium(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget body2Medium(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _BodyTextBuilder(
        data,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );
}
