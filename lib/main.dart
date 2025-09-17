// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/core/di/service_locator.dart';
import 'package:task_app/core/localization/language_cubit.dart';
import 'package:task_app/core/resources/app_colors.dart';
import 'package:task_app/core/resources/shared_app_strings.dart';
import 'package:task_app/core/theme/theme_cubit.dart';
import 'package:task_app/l10n/app_localizations.dart';
import 'package:task_app/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (final context) => const FlutterTemplate(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class FlutterTemplate extends StatefulWidget {
  const FlutterTemplate({super.key});

  @override
  State<FlutterTemplate> createState() => _FlutterTemplateState();
}

class _FlutterTemplateState extends State<FlutterTemplate> {
  late final ThemeCubit themeCubit;
  late final LanguageCubit languageCubit;

  @override
  void initState() {
    themeCubit = sl<ThemeCubit>();
    languageCubit = sl<LanguageCubit>();
    languageCubit.getLanguage();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (final _) => sl<ThemeCubit>(),
          ),
          BlocProvider<LanguageCubit>(
            create: (final _) => sl<LanguageCubit>(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(440, 956),
          child: BlocBuilder<ThemeCubit, ThemeData>(
            bloc: themeCubit,
            builder: (final context, final themeState) => BlocBuilder<LanguageCubit, Locale>(
              bloc: languageCubit,
              builder: (final context, final localeState) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: SharedAppStrings.appNameString, // Your app name here
                locale: localeState,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('hi'), Locale('mr')],
                theme: themeState,
                themeMode: ThemeMode.light,
                routerConfig: router,
                builder: (final context, final child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(.8)),
                  child: child!,
                ),
              ),
            ),
          ),
        ),
      );
}
