// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get kudoAppTitle => 'Kudo App';

  @override
  String get welcomeToKudoLabel => 'Welcome to Kudo';

  @override
  String get loginEnterYourUserInfoText => 'Enter your user information';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHintText => 'Enter your email';

  @override
  String get emailErrorText => 'The email is not valid';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHintText => 'Enter your password';

  @override
  String get passwordErrorText => 'The password is not valid';

  @override
  String get loginButtonLabel => 'Login';

  @override
  String get forgotPasswordLabel => 'Forgot password?';

  @override
  String get dontHaveAnAccountLabel => 'Don\'t have an account?';

  @override
  String get signUpLabel => 'Sign up';

  @override
  String get signUpButtonLabel => 'Sign up';

  @override
  String get signUpCreateYourAccountText => 'Create your account';

  @override
  String get signUpEnterYourPersonalInfoText => 'Enter your personal information';

  @override
  String get nameLabel => 'Name';

  @override
  String get nameHintText => 'Enter your name';

  @override
  String get nameErrorText => 'The name is not valid';

  @override
  String get lastNameLabel => 'Last name';

  @override
  String get lastNameHintText => 'Enter your last name';

  @override
  String get lastNameErrorText => 'The last name is not valid';

  @override
  String get signUpAlreadyHaveAnAccountLabel => 'Already have an account?';

  @override
  String get signInLabel => 'Sign in';

  @override
  String get dniLabel => 'Identiy card (V)';

  @override
  String get dniHintText => 'Enter your identity card';

  @override
  String get dniErrorText => 'The identity card is not valid';

  @override
  String get kudoErrorText => 'Oops! Something went wrong!';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get confirmButtonLabel => 'Confirm';

  @override
  String get continueButtonLabel => 'Continue';

  @override
  String get acceptButtonLabel => 'Accept';

  @override
  String get sendButtonLabel => 'Send';

  @override
  String get goBackButtonLabel => 'Go back';

  @override
  String get viewCommerceButtonLabel => "See gift card";

  @override
  String get signUpSuccessText => 'Enter to your email to validate your account, to start accumulating stamps and redeem rewards at your favorite stores.';

  @override
  String get signUpCompletedLabel => 'Sign up completed!';

  @override
  String get pleaseTryAgainLabel => 'Please try again';

  @override
  String get recoverPasswordText => 'Enter your email to recover your password';

  @override
  String get recoverPasswordLabel => 'Recover password';

  @override
  String get recoverPasswordEnterCodeText => 'Enter the code sent to your email';

  @override
  String get forgotPasswordEmailSendSuccessLabel => 'Email sent successfully!';

  @override
  String get forgotPasswordEmailSendSuccessText => 'Enter the recovery link we have sent you';

  @override
  String get waitLabel => 'Wait';

  @override
  String get waitLabelWithExpression => 'Wait!';

  @override
  String get loginNeedToValidateEmailText => 'You must confirm your account by email before logging in.';

  @override
  String get homeLabel => 'Home';

  @override
  String get profileLabel => 'Profile';

  @override
  String get historyLabel => 'Recently viewed';

  @override
  String get likedLabel => 'Favorites';

  @override
  String get bookmarksLabel => 'Your list';

  @override
  String get kudearLabel => 'Kudear';

  @override
  String get cardsLabel => 'Cards';

  @override
  String welcomeWithNameLabel(Object name) {
    return 'Welcome, $name';
  }

  @override
  String get cumulativeTotalLabel => 'Cumulative total';

  @override
  String get redeemedTotalLabel => 'Redeemed total';

  @override
  String numberOfStampsLabel(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n stamps',
      one: '1 stamp',
    );
    return '$_temp0';
  }

  @override
  String get kudoStandardErrorMessage => 'An error ocurred';

  @override
  String get kudoRetryButtonLabel => 'Retry';

  @override
  String get newRewardsLabel => 'New rewards';

  @override
  String get newCommercesLabel => 'New commerces';

  @override
  String get seeMoreLabel => 'See more';

  @override
  String get kudoConnectionErrorTitle => 'Connection error';

  @override
  String get kudoConnectionErrorNoInternetDescription => 'Please check your internet connection and try again.';

  @override
  String get kudoConnectionErrorVpnDetectedTitle => 'VPN detected';

  @override
  String get kudoConnectionErrorActiveVPNDescription => 'Please disable your VPN connection and try again.';

  @override
  String get kudoMaintenanceModeTitle => 'The app is under maintenance';

  @override
  String get kudoMaintenanceModeDescription => 'We are working to improve the app. Please, come back later.';

  @override
  String get kudoUpdateRequiredTitle => 'Update required';

  @override
  String get kudoUpdateRequiredDescription => 'You must update to the latest version to continue.';

  @override
  String get kudoServerErrorMessage => 'An error occurred while processing your request. Please try again.';

  @override
  String get kudoUnknownErrorMessage => 'An unexpected error occurred. Please try again.';

  @override
  String get kudoStillHavingProblemsButton => 'Still having problems?';

  @override
  String get kudoContactSupportButton => 'Contact support';

  @override
  String get kudoUpdateAppButton => 'Update app';

  @override
  String get kudoErrorOpeningUpdateUrlTitle => 'Could not open store';

  @override
  String get kudoErrorOpeningUpdateUrlDescription => 'Please update the app manually.';

  @override
  String get fortgotPasswordNotEmailLabel => 'The email entered is not registered in Kudo';

  @override
  String get profilePersonalInfoLabel => 'Personal information';

  @override
  String get profileTermsAndConditionsLabel => 'Terms and conditions';

  @override
  String get profileDeleteAccountLabel => 'Delete account';

  @override
  String get profileDeleteAccountWarningLabel => 'Are you sure you want to delete your account?';

  @override
  String get profileDeleteAccountDescriptionLabel => 'Your account will be permanently deleted and you will not be able to recover it.';

  @override
  String get profileDeleteAccountSuccessLabel => 'Your account has been successfully deleted.';

  @override
  String get profileLogoutLabel => 'Logout';

  @override
  String get areYouSureLabel => 'Are you sure?';

  @override
  String get logoutConfirmationText => 'If you log out, you will have to log in again';

  @override
  String get exceptioNoCurrentUserFoundLabel => 'No user found on this device';

  @override
  String get profileFullNameLabel => 'Full name';

  @override
  String get commerceSearchLabel => 'Search commerce';

  @override
  String get openLabel => 'Open';

  @override
  String get closeLabel => 'Close';

  @override
  String get commercesSearchNoFoundTitleLabel => 'We couldn\'t find a commerce';

  @override
  String get commercesSearchNoFoundDescriptionLabel => 'Keep exploring with other categories or names and discover all the affiliated commerces for you!';

  @override
  String get cardsNoFoundTitleLabel => 'You don\'t have any cards added yet';

  @override
  String get cardsNoFoundDescriptionLabel => 'Start enjoying rewards! Explore our affiliated commerces and add your first loyalty card.';

  @override
  String get loyaltyPlanLabel => 'Loyalty plan';

  @override
  String get informationLabel => 'Information';

  @override
  String get commerceLoyaltyCardDescriptionText => 'Welcome to your loyalty plan! Collect stamps with every purchase and unlock amazing rewards. Here you can see the prizes that await you.';

  @override
  String get activateLoyaltyPlanButtonLabel => 'Activate plan';

  @override
  String get rewardsLabel => 'Rewards';

  @override
  String get nextRewardsLabel => 'Next rewards';

  @override
  String get contactLabel => 'Contact';

  @override
  String get openingHoursLabel => 'Opening hours';

  @override
  String get locationLabel => 'Location';

  @override
  String phoneNumerWithNumberLabel(Object phone) {
    return 'Phone number: $phone';
  }

  @override
  String get privacyPolicyLabel => 'Privacy policy';

  @override
  String get commerceDetailNoLoyaltyCardAvailableLabel => 'The store currently does not have a loyalty card available';

  @override
  String commerceDetailNoLoyaltyCardAvailableDescriptionLabel(Object commerceName) {
    return 'Don\'t worry! $commerceName will soon have a card available for you.';
  }

  @override
  String get commerceLoyaltyCardDoYouWantToActivateLabel => 'Do you want to activate this plan?';

  @override
  String get commerceLoyaltyCardActivateDescriptionText => 'Activate it and collect stamps to redeem your rewards';

  @override
  String get commerceLoyaltyCardActivatedLabel => 'Loyalty plan activated!';

  @override
  String commerceLoyaltyCardActivatedDescription(Object commerceName) {
    return 'You can now start collecting stamps. Visit $commerceName, shop, and claim your card to receive your stamps';
  }

  @override
  String get filtersLabel => 'Filters';

  @override
  String get filtersRestoreButtonLabel => 'Restore';

  @override
  String get filtersApplyButtonLabel => 'Apply';

  @override
  String get availableRewardsLabel => 'Available rewards';

  @override
  String get redeemedRewardsLabel => 'Redeemed rewards';

  @override
  String get cardDetailsNotAvailableLabel => 'Card details not available';

  @override
  String get withOutCameraPermissionLabel => 'You don\'t have camera permissions to scan';

  @override
  String get pleaseAllowCameraPermissionLabel => 'Please enable camera permissions';

  @override
  String get youRequestedANewStampLabel => 'Your request to claim a stamp has been successful!';

  @override
  String get youRequestedANewStampDescriptionLabel => 'Go to the store\'s checkout to claim your stamp. You\'re one step closer to redeeming your reward!';

  @override
  String get stampsLabel => 'Stamps';

  @override
  String get obtainLabel => 'Obtain';

  @override
  String get rewardsNoFoundTitleLabel => 'Currently there are no new rewards available';

  @override
  String get rewardsNoFoundDescriptionLabel => 'Stay tuned for new rewards coming soon';

  @override
  String get noNewCommercesDescriptionLabel => 'Stay tuned for new commerces coming soon';

  @override
  String get scanHeaderLabel => 'Scan and Done';

  @override
  String get claimRewardCodeGeneratedLabel => 'You\'re almost there to claim your prize!';

  @override
  String get claimRewardCodeGeneratedDescriptionLabel => 'Go to the store\'s checkout and present the following code to redeem your reward.';

  @override
  String get discountRewardTypeLabel => "Discount Reward";

  @override
  String get dollarRewardTypeLabel => "Cash Reward";

  @override
  String get countOrdinalCardRepetitionFirst => "st";

  @override
  String get countOrdinalCardRepetitionSecond => "nd";

  @override
  String get countOrdinalCardRepetitionThird => "rd";

  @override
  String get countOrdinalCardRepetitionOther => "th";

  @override
  String get countOrdinalCardRepetitionSeven => "th";

  @override
  String get countOrdinalCardRepetitionEight => "th";

  @override
  String get countOrdinalCardRepetitionNine => "th";

  @override
  String countOrdinalCardRepetitionLabel(Object ordinalNumber) {
    return "This is your $ordinalNumber time collecting this card";
  }

  @override
  String get tooltipPendingLabel => "pending";

  @override
  String get tooltipCompletedLabel => "claimed";

  @override
  String get tooltipUnclaimedLabel => "available";

  @override
  String get tooltipStampLabel => "Stamp";

  @override
  String get tooltipRewardLabel => "Reward";
}
