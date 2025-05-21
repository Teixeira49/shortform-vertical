import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @kudoAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Kudo App'**
  String get mediaAppTitle;

  /// No description provided for @welcomeToKudoLabel.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Kudo'**
  String get welcomeToAppLabel;

  /// No description provided for @loginEnterYourUserInfoText.
  ///
  /// In en, this message translates to:
  /// **'Enter your user information'**
  String get loginEnterYourUserInfoText;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHintText;

  /// No description provided for @emailErrorText.
  ///
  /// In en, this message translates to:
  /// **'The email is not valid'**
  String get emailErrorText;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHintText;

  /// No description provided for @passwordErrorText.
  ///
  /// In en, this message translates to:
  /// **'The password is not valid'**
  String get passwordErrorText;

  /// No description provided for @loginButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonLabel;

  /// No description provided for @forgotPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordLabel;

  /// No description provided for @dontHaveAnAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccountLabel;

  /// No description provided for @signUpLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpLabel;

  /// No description provided for @signUpButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpButtonLabel;

  /// No description provided for @signUpCreateYourAccountText.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get signUpCreateYourAccountText;

  /// No description provided for @signUpEnterYourPersonalInfoText.
  ///
  /// In en, this message translates to:
  /// **'Enter your personal information'**
  String get signUpEnterYourPersonalInfoText;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @nameHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHintText;

  /// No description provided for @nameErrorText.
  ///
  /// In en, this message translates to:
  /// **'The name is not valid'**
  String get nameErrorText;

  /// No description provided for @lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastNameLabel;

  /// No description provided for @lastNameHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get lastNameHintText;

  /// No description provided for @lastNameErrorText.
  ///
  /// In en, this message translates to:
  /// **'The last name is not valid'**
  String get lastNameErrorText;

  /// No description provided for @signUpAlreadyHaveAnAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signUpAlreadyHaveAnAccountLabel;

  /// No description provided for @signInLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInLabel;

  /// No description provided for @dniLabel.
  ///
  /// In en, this message translates to:
  /// **'Identiy card (V)'**
  String get dniLabel;

  /// No description provided for @dniHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your identity card'**
  String get dniHintText;

  /// No description provided for @dniErrorText.
  ///
  /// In en, this message translates to:
  /// **'The identity card is not valid'**
  String get dniErrorText;

  /// No description provided for @kudoErrorText.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong!'**
  String get kudoErrorText;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;

  /// No description provided for @confirmButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButtonLabel;

  /// No description provided for @continueButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButtonLabel;

  /// No description provided for @acceptButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptButtonLabel;

  /// No description provided for @sendButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sendButtonLabel;

  /// No description provided for @goBackButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBackButtonLabel;

  /// No description provided for @goBackButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get viewCommerceButtonLabel;

  /// No description provided for @signUpSuccessText.
  ///
  /// In en, this message translates to:
  /// **'Enter to your email to validate your account, to start accumulating stamps and redeem rewards at your favorite stores.'**
  String get signUpSuccessText;

  /// No description provided for @signUpCompletedLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign up completed!'**
  String get signUpCompletedLabel;

  /// No description provided for @pleaseTryAgainLabel.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get pleaseTryAgainLabel;

  /// No description provided for @recoverPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to recover your password'**
  String get recoverPasswordText;

  /// No description provided for @recoverPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Recover password'**
  String get recoverPasswordLabel;

  /// No description provided for @recoverPasswordEnterCodeText.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to your email'**
  String get recoverPasswordEnterCodeText;

  /// No description provided for @forgotPasswordEmailSendSuccessLabel.
  ///
  /// In en, this message translates to:
  /// **'Email sent successfully!'**
  String get forgotPasswordEmailSendSuccessLabel;

  /// No description provided for @forgotPasswordEmailSendSuccessText.
  ///
  /// In en, this message translates to:
  /// **'Enter the recovery link we have sent you'**
  String get forgotPasswordEmailSendSuccessText;

  /// No description provided for @waitLabel.
  ///
  /// In en, this message translates to:
  /// **'Wait'**
  String get waitLabel;

  /// No description provided for @waitLabelWithExpression.
  ///
  /// In en, this message translates to:
  /// **'Wait'**
  String get waitLabelWithExpression;

  /// No description provided for @loginNeedToValidateEmailText.
  ///
  /// In en, this message translates to:
  /// **'You must confirm your account by email before logging in.'**
  String get loginNeedToValidateEmailText;

  /// No description provided for @homeLabel.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeLabel;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @searchLabel.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchLabel;

  /// No description provided for @commercesLabel.
  ///
  /// In en, this message translates to:
  /// **'Commerces'**
  String get historyLabel;

  /// No description provided for @commercesLabel.
  ///
  /// In en, this message translates to:
  /// **'Commerces'**
  String get likedLabel;

  /// No description provided for @commercesLabel.
  ///
  /// In en, this message translates to:
  /// **'Commerces'**
  String get bookmarksLabel;

  /// No description provided for @welcomeWithNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeWithNameLabel(Object name);

  /// No description provided for @seeMoreLabel.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMoreLabel;

  /// No description provided for @kudoConnectionErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Connection error'**
  String get appConnectionErrorTitle;

  /// No description provided for @kudoConnectionErrorNoInternetDescription.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get appConnectionErrorNoInternetDescription;

  /// No description provided for @kudoConnectionErrorVpnDetectedTitle.
  ///
  /// In en, this message translates to:
  /// **'VPN detected'**
  String get aooConnectionErrorVpnDetectedTitle;

  /// No description provided for @kudoConnectionErrorActiveVPNDescription.
  ///
  /// In en, this message translates to:
  /// **'Please disable your VPN connection and try again.'**
  String get appConnectionErrorActiveVPNDescription;

  /// No description provided for @kudoMaintenanceModeTitle.
  ///
  /// In en, this message translates to:
  /// **'The app is under maintenance'**
  String get appMaintenanceModeTitle;

  /// No description provided for @kudoMaintenanceModeDescription.
  ///
  /// In en, this message translates to:
  /// **'We are working to improve the app. Please, come back later.'**
  String get appMaintenanceModeDescription;

  /// No description provided for @kudoUpdateRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get appUpdateRequiredTitle;

  /// No description provided for @kudoUpdateRequiredDescription.
  ///
  /// In en, this message translates to:
  /// **'You must update to the latest version to continue.'**
  String get appUpdateRequiredDescription;

  /// No description provided for @kudoServerErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while processing your request. Please try again.'**
  String get appServerErrorMessage;

  /// No description provided for @kudoUnknownErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get appUnknownErrorMessage;

  /// No description provided for @kudoStillHavingProblemsButton.
  ///
  /// In en, this message translates to:
  /// **'Still having problems?'**
  String get appStillHavingProblemsButton;

  /// No description provided for @kudoContactSupportButton.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get appContactSupportButton;

  /// No description provided for @kudoUpdateAppButton.
  ///
  /// In en, this message translates to:
  /// **'Update app'**
  String get appUpdateAppButton;

  /// No description provided for @kudoErrorOpeningUpdateUrlTitle.
  ///
  /// In en, this message translates to:
  /// **'Could not open store'**
  String get appErrorOpeningUpdateUrlTitle;

  /// No description provided for @kudoErrorOpeningUpdateUrlDescription.
  ///
  /// In en, this message translates to:
  /// **'Please update the app manually.'**
  String get appErrorOpeningUpdateUrlDescription;

  /// No description provided for @fortgotPasswordNotEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'The email entered is not registered in Kudo'**
  String get forgotPasswordNotEmailLabel;

  /// No description provided for @profilePersonalInfoLabel.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get profilePersonalInfoLabel;

  /// No description provided for @profileTermsAndConditionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get profileTermsAndConditionsLabel;

  /// No description provided for @profileDeleteAccountLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get profileDeleteAccountLabel;

  /// No description provided for @profileDeleteAccountWarningLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get profileDeleteAccountWarningLabel;

  /// No description provided for @profileDeleteAccountDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get profileDeleteAccountDescriptionLabel;

  /// No description provided for @profileDeleteAccountSuccessLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get profileDeleteAccountSuccessLabel;

  /// No description provided for @profileLogoutLabel.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogoutLabel;

  /// No description provided for @areYouSureLabel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSureLabel;

  /// No description provided for @logoutConfirmationText.
  ///
  /// In en, this message translates to:
  /// **'If you log out, you will have to log in again'**
  String get logoutConfirmationText;

  /// No description provided for @exceptioNoCurrentUserFoundLabel.
  ///
  /// In en, this message translates to:
  /// **'No user found on this device'**
  String get exceptionNoCurrentUserFoundLabel;

  /// No description provided for @profileFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profileFullNameLabel;

  /// No description provided for @openLabel.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openLabel;

  /// No description provided for @closeLabel.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeLabel;

  /// No description provided for @informationLabel.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get informationLabel;

  /// No description provided for @rewardsLabel.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewardsLabel;

  /// No description provided for @nextRewardsLabel.
  ///
  /// In en, this message translates to:
  /// **'Next rewards'**
  String get nextRewardsLabel;

  /// No description provided for @contactLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactLabel;

  /// No description provided for @openingHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Opening hours'**
  String get openingHoursLabel;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @phoneNumerWithNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number: {phone}'**
  String phoneNumberWithNumberLabel(Object phone);

  /// No description provided for @privacyPolicyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicyLabel;

  /// No description provided for @filtersLabel.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersLabel;

  /// No description provided for @filtersRestoreButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get filtersRestoreButtonLabel;

  /// No description provided for @filtersApplyButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filtersApplyButtonLabel;

  /// No description provided for @availableRewardsLabel.
  ///
  /// In en, this message translates to:
  /// **'Available rewards'**
  String get availableRewardsLabel;

  /// No description provided for @redeemedRewardsLabel.
  ///
  /// In en, this message translates to:
  /// **'Redeemed rewards'**
  String get redeemedRewardsLabel;

  /// No description provided for @obtainLabel.
  ///
  /// In en, this message translates to:
  /// **'Obtain'**
  String get obtainLabel;

  /// No description provided for @browseByLabel.
  ///
  /// In en, this message translates to:
  /// **'Browse by'**
  String get browseByLabel;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @genreLabel.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genreLabel;

  /// No description provided for @moviesLabel.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get moviesLabel;

  /// No description provided for @mediaOriginalsLabel.
  ///
  ///  In en, this message translates to:
  ///  **'Media Originals'**
  String get mediaOriginalsLabel;

  /// No description provided for @shortsLabel.
  ///
  /// In en, this message translates to:
  /// 'Shorts'
  String get shortsLabel;

  /// No description provided for @kidsLabels.
  ///
  /// In en, this message translates to:
  /// 'For Kids'
  String get kidsLabels;

  /// No description provided for @forYouLabel.
  ///
  /// In en, this message translates to:
  /// 'For You'
  String get forYouLabel;

  /// No description provided for @viewAllLabel.
  ///
  /// In en, this message translates to:
  /// 'View All'
  String get viewAllLabel;

  /// No description provided for @menuLabel.
  ///
  /// In en, this message translates to:
  /// 'Menu'
  String get menuLabel;

  /// No description provided for @editProfileButton.
  ///
  /// In en, this message translates to:
  /// 'Edit Profile'
  String get editProfileButton;

  /// No description provided for @aboutUsButton.
  ///
  /// In en, this message translates to:
  /// 'About Us'
  String get aboutUsButton;

  /// No description provided for @aboutYouButton.
  ///
  /// In en, this message translates to:
  /// 'About You'
  String get aboutYouButton;

  /// No description provided for @settingsButton.
  ///
  /// In en, this message translates to:
  /// 'Settings'
  String get settingsButton;

  /// No description provided for @helpButton.
  ///
  /// In en, this message translates to:
  /// 'Help'
  String get helpButton;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// 'Log out'
  String get logoutButton;

  /// No description provided for @deleteAccountButton.
  ///
  /// In en, this message translates to:
  /// 'Delete Account'
  String get deleteAccountButton;

  /// No description provided for @termsAndConditionsButton.
  ///
  /// In en, this message translates to:
  /// 'terms and conditions'
  String get termsAndConditionsButton;

  /// No description provided for @getPremiumButton.
  ///
  /// In en, this message translates to:
  /// 'get Premium'
  String get getPremiumButton;

  /// No description provided for @searchByLabel.
  ///
  /// In en, this message translates to:
  /// 'Search by'
  String get searchByLabel;

  /// No description provided for @resultsLabel.
  ///
  /// In en, this message translates to:
  /// 'Results'
  String get resultsLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
