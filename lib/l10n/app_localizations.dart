import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('mr')
  ];

  /// Instructions to select language
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectLanguage;

  /// Information about how to change language
  ///
  /// In en, this message translates to:
  /// **'Your selected language can be changed\nanytime from Settings.'**
  String get selectLanguageDesc;

  /// No description provided for @continueString.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueString;

  /// No description provided for @skipString.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipString;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get onboarding1Title;

  /// No description provided for @enterMobileString.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid mobile number to continue\nusing delivery and other features'**
  String get enterMobileString;

  /// No description provided for @enterMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterMobileHint;

  /// No description provided for @nameString.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameString;

  /// No description provided for @emailString.
  ///
  /// In en, this message translates to:
  /// **'Email Id'**
  String get emailString;

  /// No description provided for @otpString.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otpString;

  /// No description provided for @loginString.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginString;

  /// No description provided for @registerString.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registerString;

  /// No description provided for @driverAskString.
  ///
  /// In en, this message translates to:
  /// **'Are You Driver?'**
  String get driverAskString;

  /// No description provided for @yesString.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesString;

  /// No description provided for @noString.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noString;

  /// No description provided for @updatePersonalDetailsString.
  ///
  /// In en, this message translates to:
  /// **'Update Personal Details'**
  String get updatePersonalDetailsString;

  /// No description provided for @submitString.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitString;

  /// No description provided for @statusString.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusString;

  /// No description provided for @typeString.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get typeString;

  /// No description provided for @dateString.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateString;

  /// No description provided for @goString.
  ///
  /// In en, this message translates to:
  /// **'Go'**
  String get goString;

  /// No description provided for @okString.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get okString;

  /// No description provided for @referFreindString.
  ///
  /// In en, this message translates to:
  /// **'Refer your friends!'**
  String get referFreindString;

  /// No description provided for @inviteString.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get inviteString;

  /// No description provided for @supportLegalString.
  ///
  /// In en, this message translates to:
  /// **'Support & Legal'**
  String get supportLegalString;

  /// No description provided for @helpSupportString.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupportString;

  /// No description provided for @termsConditionString.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditionString;

  /// No description provided for @settingString.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingString;

  /// No description provided for @chooseLanguageString.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguageString;

  /// No description provided for @logoutString.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutString;

  /// No description provided for @referEarnString.
  ///
  /// In en, this message translates to:
  /// **'Refer & Earn'**
  String get referEarnString;

  /// No description provided for @phoneNumberString.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberString;

  /// No description provided for @validPhoneNumberString.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid phone number'**
  String get validPhoneNumberString;

  /// No description provided for @validEnterPhoneNumberString.
  ///
  /// In en, this message translates to:
  /// **'Please enter phone number'**
  String get validEnterPhoneNumberString;

  /// No description provided for @validNameString.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid name'**
  String get validNameString;

  /// No description provided for @valideEmailString.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid email address'**
  String get valideEmailString;

  /// No description provided for @registrationFailedString.
  ///
  /// In en, this message translates to:
  /// **'Registration Failed'**
  String get registrationFailedString;

  /// No description provided for @pleaseUploadString.
  ///
  /// In en, this message translates to:
  /// **'Please upload'**
  String get pleaseUploadString;

  /// No description provided for @pleaseEnterString.
  ///
  /// In en, this message translates to:
  /// **'Please enter'**
  String get pleaseEnterString;

  /// No description provided for @photoSmallString.
  ///
  /// In en, this message translates to:
  /// **'photo'**
  String get photoSmallString;

  /// No description provided for @typeAMessageString.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get typeAMessageString;

  /// No description provided for @hiString.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get hiString;

  /// No description provided for @welecomeToString.
  ///
  /// In en, this message translates to:
  /// **'welcome to'**
  String get welecomeToString;

  /// No description provided for @etcString.
  ///
  /// In en, this message translates to:
  /// **'etc.'**
  String get etcString;

  /// No description provided for @pendingString.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingString;

  /// No description provided for @verificationString.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verificationString;

  /// No description provided for @verificationInProcessString.
  ///
  /// In en, this message translates to:
  /// **'Verification is in process'**
  String get verificationInProcessString;

  /// No description provided for @verificationDoneString.
  ///
  /// In en, this message translates to:
  /// **'Verification is done'**
  String get verificationDoneString;

  /// No description provided for @validString.
  ///
  /// In en, this message translates to:
  /// **'valid'**
  String get validString;

  /// No description provided for @viewString.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get viewString;

  /// No description provided for @documentsString.
  ///
  /// In en, this message translates to:
  /// **'Document'**
  String get documentsString;

  /// No description provided for @confirmString.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmString;

  /// No description provided for @resendOtpString.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtpString;

  /// No description provided for @resendOtpIn.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in'**
  String get resendOtpIn;

  /// No description provided for @selectContactString.
  ///
  /// In en, this message translates to:
  /// **'Select Contact'**
  String get selectContactString;

  /// No description provided for @cancelString.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelString;

  /// No description provided for @startedString.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get startedString;

  /// No description provided for @startString.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startString;

  /// No description provided for @enterOtpString.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOtpString;

  /// No description provided for @dataString.
  ///
  /// In en, this message translates to:
  /// **'data'**
  String get dataString;

  /// No description provided for @homeString.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeString;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'mr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
