import 'package:game_center/main.import.dart';

class _SubheadingTextBuilder extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  const _SubheadingTextBuilder(this.data,
      {Key? key,
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
          .subtitle1!
          .copyWith(color: color, fontSize: 14, fontWeight: fontWeight),
    );
  }
}

class SubheadingText {
  Widget bold(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        fontWeight: FontWeight.w700,
        textAlign: textAlign,
      );

  Widget medium(String data,
          {TextAlign? textAlign,
          int? maxLines,
          TextOverflow? overflow,
          Color? color,
          bool autoSizeEnabled = false}) =>
      _SubheadingTextBuilder(
        data,
        color: color,
        maxLines: maxLines,
        overflow: overflow,
        fontWeight: FontWeight.w500,
        textAlign: textAlign,
      );
}
