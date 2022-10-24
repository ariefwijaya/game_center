part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppTheme theme;

  const ThemeState(this.theme);

  ThemeData get themeData => appThemeData[theme]!;

  @override
  List<Object> get props => [theme];
}
