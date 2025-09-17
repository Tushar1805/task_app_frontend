import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/core/di/service_locator.dart';
import 'package:task_app/core/resources/app_keys.dart';
import 'package:task_app/core/resources/app_storage.dart';
import 'package:task_app/core/utils/core_utils.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('en'));
  final storage = sl<SecureStorage>();

  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  Future<void> getLanguage() async {
    final val = await storage.readValue(languageCodeKey);
    _appLocale = Locale(val ?? 'en');
    customPrint('Entered to check Language: ${_appLocale?.languageCode}');
    emit(Locale(val ?? 'en'));
  }

  void changeLanguage(final Locale type) async {
    _appLocale = type;
    if (type == Locale('en')) {
      await storage.saveValue(key: languageCodeKey, value: 'en');
      emit(Locale('en'));
    } else if (type == Locale('hi')) {
      await storage.saveValue(key: languageCodeKey, value: 'hi');
      emit(Locale('hi'));
    } else {
      await storage.saveValue(key: languageCodeKey, value: 'mr');
      emit(Locale('mr'));
    }
    customPrint('App Language Changed: ${_appLocale?.languageCode}');
  }
}
