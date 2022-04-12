import 'package:bloc/bloc.dart';
import 'package:clinic/l10n/l10n.dart';
import 'package:clinic/services/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  Locale? _locale;
  Locale? get locale => _locale;

  void change(String value) {}

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    CacheHelper.saveData(key: 'lang', value: _locale!.languageCode);
    emit(ChangeLocalizationState());
  }

  void clearLocale() {
    _locale = null;
    emit(ChangeLocalizationState());
  }
}
