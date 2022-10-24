import 'package:game_center/main.import.dart';

class _HeadingTextBuilder extends StatelessWidget {
  final String data;
  final double fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  const _HeadingTextBuilder(this.data,
      {Key? key,
      required this.fontSize,
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
      style: Theme.of(context).textTheme.headline1!.copyWith(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w800),
    );
  }
}

class HeadingText {
  Widget h1(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(
        data,
        fontSize: 36,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget h2(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(
        data,
        fontSize: 30,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget h3(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(
        data,
        fontSize: 24,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
      );

  Widget h4(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(data,
          fontSize: 18,
          color: color,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign);

  Widget h5(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(data,
          fontSize: 16,
          color: color,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign);

  Widget h6(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _HeadingTextBuilder(data,
          fontSize: 12,
          color: color,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: textAlign);
}
