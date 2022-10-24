import 'package:equatable/equatable.dart';
import 'package:game_center/core/app_setting.dart';
import 'package:game_center/core/language/repositories/language_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:easy_localization/easy_localization.dart';

part 'language_state.dart';

@injectable
class LanguageCubit extends Cubit<LanguageState> {
  final LanguageRepositoryInterface languageRepository;
  LanguageCubit({required this.languageRepository})
      : super(LanguageState(AppSetting.defaultLanguage.toLocale()));

  BuildContext? context;

  Future<void> change(Locale locale) async {
    await context?.setLocale(locale);
    await languageRepository.setLanguage(locale.languageCode);
    emit(LanguageState(locale));
  }

  Future<void> init(BuildContext srcContext) async {
    context = srcContext;
    final lang = await languageRepository.getSelectedLanguage();
    await context?.setLocale(lang.toLocale());
    emit(LanguageState(lang.toLocale()));
  }
}
