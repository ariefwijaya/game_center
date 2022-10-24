import 'body_text.dart';
import 'heading_text.dart';
import 'subheading_text.dart';

abstract class TypographyCustom {
  const TypographyCustom._();
  static final HeadingText heading = HeadingText();
  static final SubheadingText subheading = SubheadingText();
  static final BodyText bodyText = BodyText();
}
