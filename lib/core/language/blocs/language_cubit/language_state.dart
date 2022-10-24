part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale languageCode;
  const LanguageState(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}
