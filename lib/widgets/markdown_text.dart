import 'package:game_center/main.import.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final TextStyle? strongStyle;
  final TextAlign textAlign;
  final Widget Function(Uri, String?, String?)? imageBuilder;
  final void Function(String text, String? href, String title)? onTapLink;
  const MarkdownText(
      {Key? key,
      required this.text,
      this.textStyle,
      this.textAlign = TextAlign.start,
      this.imageBuilder,
      this.linkStyle,
      this.strongStyle,
      this.onTapLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
        data: text,
        imageBuilder: imageBuilder,
        onTapLink: (text, href, title) {
          if (onTapLink != null) {
            onTapLink?.call(text, href, title);
          } else {
            LauncherHelper.openUrl(href!);
          }
        },
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            textAlign: _getTextAlign(),
            a: linkStyle ??
                textStyle?.copyWith(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline) ??
                TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
            p: textStyle,
            strong: strongStyle ??
                textStyle?.copyWith(fontWeight: FontWeight.bold)));
  }

  WrapAlignment? _getTextAlign() {
    if (textAlign == TextAlign.center) {
      return WrapAlignment.center;
    } else if (textAlign == TextAlign.start) {
      return WrapAlignment.start;
    } else if (textAlign == TextAlign.end) {
      return WrapAlignment.end;
    }
    return null;
  }
}
