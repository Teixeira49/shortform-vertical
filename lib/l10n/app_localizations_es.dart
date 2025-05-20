// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get kudoAppTitle => 'Kudo App';

  @override
  String get welcomeToKudoLabel => 'Bienvenido a Kudo';

  @override
  String get loginEnterYourUserInfoText => 'Ingrese su información de usuario';

  @override
  String get emailLabel => 'Correo';

  @override
  String get emailHintText => 'Ingrese su correo';

  @override
  String get emailErrorText => 'El correo no es válido';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHintText => 'Ingrese su contraseña';

  @override
  String get passwordErrorText => 'La contraseña no es válida';

  @override
  String get loginButtonLabel => 'Iniciar sesión';

  @override
  String get forgotPasswordLabel => '¿Olvidaste tu contraseña?';

  @override
  String get dontHaveAnAccountLabel => '¿No tienes una cuenta?';

  @override
  String get signUpLabel => 'Regístrate';

  @override
  String get signUpButtonLabel => 'Regístrate';

  @override
  String get signUpCreateYourAccountText => 'Crea tu cuenta';

  @override
  String get signUpEnterYourPersonalInfoText => 'Ingrese su información personal';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get nameHintText => 'Ingrese su nombre';

  @override
  String get nameErrorText => 'El nombre no es válido';

  @override
  String get lastNameLabel => 'Apellido';

  @override
  String get lastNameHintText => 'Ingrese su apellido';

  @override
  String get lastNameErrorText => 'El apellido no es válido';

  @override
  String get signUpAlreadyHaveAnAccountLabel => '¿Ya tienes una cuenta?';

  @override
  String get signInLabel => 'Iniciar sesión';

  @override
  String get dniLabel => 'Cédula (V)';

  @override
  String get dniHintText => 'Ingrese su cédula';

  @override
  String get dniErrorText => 'La cédula no es válida';

  @override
  String get kudoErrorText => '¡Ups! Algo salió mal';

  @override
  String get cancelButtonLabel => 'Cancelar';

  @override
  String get confirmButtonLabel => 'Confirmar';

  @override
  String get continueButtonLabel => 'Continuar';

  @override
  String get acceptButtonLabel => 'Aceptar';

  @override
  String get sendButtonLabel => 'Enviar';

  @override
  String get goBackButtonLabel => 'Regresar';

  @override
  String get viewCommerceButtonLabel => "Ver Tarjeta";

  @override
  String get signUpSuccessText => 'Ingresa a tu correo para validar tu cuenta, para empezar a acumular sellos y canjear recompensas en tus comercios favoritos';

  @override
  String get signUpCompletedLabel => '¡Registro completado!';

  @override
  String get pleaseTryAgainLabel => 'Por favor, inténtalo de nuevo';

  @override
  String get recoverPasswordText => 'Ingrese su correo para recuperar su contraseña';

  @override
  String get recoverPasswordLabel => 'Recuperar contraseña';

  @override
  String get recoverPasswordEnterCodeText => 'Ingrese el código enviado a su correo';

  @override
  String get forgotPasswordEmailSendSuccessLabel => '¡Correo enviado con éxito!';

  @override
  String get forgotPasswordEmailSendSuccessText => 'Ingrese al enlace de recuperación que le hemos enviado';

  @override
  String get waitLabel => 'Espera';

  @override
  String get waitLabelWithExpression => '¡Espera!';

  @override
  String get loginNeedToValidateEmailText => 'Debes confirmar tu cuenta por email antes de iniciar sesión';

  @override
  String get homeLabel => 'Inicio';

  @override
  String get profileLabel => 'Perfil';

  @override
  String get historyLabel => 'Vistos Recientemente';

  @override
  String get likedLabel => 'Favoritos';

  @override
  String get bookmarksLabel => 'Tu lista';

  @override
  String get kudearLabel => 'Kudear';

  @override
  String get cardsLabel => 'Tarjetas';

  @override
  String welcomeWithNameLabel(Object name) {
    return 'Bienvenido, $name';
  }

  @override
  String get cumulativeTotalLabel => 'Total acumulado';

  @override
  String get redeemedTotalLabel => 'Total canjeado';

  @override
  String numberOfStampsLabel(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n sellos',
      one: '1 sello',
    );
    return '$_temp0';
  }

  @override
  String get kudoStandardErrorMessage => 'Ocurrió un error';

  @override
  String get kudoRetryButtonLabel => 'Reintentar';

  @override
  String get newRewardsLabel => 'Nuevas recompensas';

  @override
  String get newCommercesLabel => 'Nuevos comercios';

  @override
  String get seeMoreLabel => 'Ver más';

  @override
  String get kudoConnectionErrorTitle => 'Error de conexión';

  @override
  String get kudoConnectionErrorNoInternetDescription => 'Por favor, verifica tu conexión a internet e inténtalo de nuevo.';

  @override
  String get kudoConnectionErrorVpnDetectedTitle => 'VPN detectada';

  @override
  String get kudoConnectionErrorActiveVPNDescription => 'Por favor, desactiva tu conexión VPN e inténtalo de nuevo.';

  @override
  String get kudoMaintenanceModeTitle => 'La aplicación está en mantenimiento';

  @override
  String get kudoMaintenanceModeDescription => 'Estamos trabajando para mejorar la aplicación. Por favor, vuelve más tarde.';

  @override
  String get kudoUpdateRequiredTitle => 'Actualización requerida';

  @override
  String get kudoUpdateRequiredDescription => 'Debes actualizar a la última versión para continuar.';

  @override
  String get kudoServerErrorMessage => 'Ocurrió un error al procesar tu solicitud. Por favor, inténtalo de nuevo.';

  @override
  String get kudoUnknownErrorMessage => 'Ocurrió un error inesperado. Por favor, inténtalo de nuevo.';

  @override
  String get kudoStillHavingProblemsButton => '¿Sigues teniendo problemas?';

  @override
  String get kudoContactSupportButton => 'Contactar soporte';

  @override
  String get kudoUpdateAppButton => 'Actualizar aplicación';

  @override
  String get kudoErrorOpeningUpdateUrlTitle => 'Error al abrir tienda';

  @override
  String get kudoErrorOpeningUpdateUrlDescription => 'Por favor, actualiza la aplicación manualmente.';

  @override
  String get fortgotPasswordNotEmailLabel => 'El correo ingresado no se encuentra registrado en Kudo';

  @override
  String get profilePersonalInfoLabel => 'Información personal';

  @override
  String get profileTermsAndConditionsLabel => 'Términos y condiciones';

  @override
  String get profileDeleteAccountLabel => 'Eliminar cuenta';

  @override
  String get profileDeleteAccountWarningLabel => '¿Estas seguro que deseas eliminar tu cuenta?';

  @override
  String get profileDeleteAccountDescriptionLabel => 'Tu cuenta sera eliminada permanentemente y no podras recuperarla';

  @override
  String get profileDeleteAccountSuccessLabel => 'Su cuenta se ha eliminado correctamente.';

  @override
  String get profileLogoutLabel => 'Cerrar sesión';

  @override
  String get areYouSureLabel => '¿Estás seguro?';

  @override
  String get logoutConfirmationText => 'Si cierras sesión, tendrás que iniciar sesión de nuevo';

  @override
  String get exceptioNoCurrentUserFoundLabel => 'No se encontró un usuario en este dispositivo';

  @override
  String get profileFullNameLabel => 'Nombre completo';

  @override
  String get commerceSearchLabel => 'Buscar comercio';

  @override
  String get openLabel => 'Abierto';

  @override
  String get closeLabel => 'Close';

  @override
  String get commercesSearchNoFoundTitleLabel => 'No hemos encontrado un comercio';

  @override
  String get commercesSearchNoFoundDescriptionLabel => '¡Sigue explorando con otras categorías o nombre y descubre todos los comercios afiliados para ti!';

  @override
  String get cardsNoFoundTitleLabel => 'Aún no tienes tarjetas agregadas';

  @override
  String get cardsNoFoundDescriptionLabel => '¡Comienza a disfrutar de recompensas! Explora nuestros comercios afiliados y agrega tu primera tarjeta de lealtad.';

  @override
  String get loyaltyPlanLabel => 'Plan de lealtad';

  @override
  String get informationLabel => 'Información';

  @override
  String get commerceLoyaltyCardDescriptionText => '¡Bienvenido a tu plan de lealtad! Acumula sellos en cada compra y desbloquea increíbles recompensas. Aquí podrás ver los premios que te esperan.';

  @override
  String get activateLoyaltyPlanButtonLabel => 'Activar plan';

  @override
  String get rewardsLabel => 'Recompensas';

  @override
  String get nextRewardsLabel => 'Próximas Recompensas';

  @override
  String get contactLabel => 'Contacto';

  @override
  String get openingHoursLabel => 'Horario de atención';

  @override
  String get locationLabel => 'Ubicación';

  @override
  String phoneNumerWithNumberLabel(Object phone) {
    return 'Teléfono: $phone';
  }

  @override
  String get privacyPolicyLabel => 'Política de privacidad';

  @override
  String get commerceDetailNoLoyaltyCardAvailableLabel => 'Actualmente el comercio no posee una tarjeta de lealtad disponible';

  @override
  String commerceDetailNoLoyaltyCardAvailableDescriptionLabel(Object commerceName) {
    return '¡No te preocupes! Pronto $commerceName tendrá una tarjeta disponible para ti.';
  }

  @override
  String get commerceLoyaltyCardDoYouWantToActivateLabel => '¿Deseas activar este plan?';

  @override
  String get commerceLoyaltyCardActivateDescriptionText => 'Actívalo y acumula sellos para canjear tus recompensas';

  @override
  String get commerceLoyaltyCardActivatedLabel => '¡Plan de lealtad activado!';

  @override
  String commerceLoyaltyCardActivatedDescription(Object commerceName) {
    return 'Ya puedes empezar a acumular sellos. Visita $commerceName, compra y reclama tu tarjeta para recibir tus sellos';
  }

  @override
  String get filtersLabel => 'Filtros';

  @override
  String get filtersRestoreButtonLabel => 'Restaurar';

  @override
  String get filtersApplyButtonLabel => 'Aplicar';

  @override
  String get availableRewardsLabel => 'Recompensas disponibles';

  @override
  String get redeemedRewardsLabel => 'Recompensas canjeadas';

  @override
  String get cardDetailsNotAvailableLabel => 'Detalles de la tarjeta no disponibles';

  @override
  String get withOutCameraPermissionLabel => 'No tienes permisos de la cámara para escanear';

  @override
  String get pleaseAllowCameraPermissionLabel => 'Por favor, habilita los permisos de la cámara';

  @override
  String get youRequestedANewStampLabel => '¡Tu solicitud para reclamar un sello ha sido exitosa!';

  @override
  String get youRequestedANewStampDescriptionLabel => 'Dirígete a la caja del comercio para poder reclamar tu sello. ¡Estás un paso más cerca de canjear tu recompensa!';

  @override
  String get stampsLabel => 'Sellos';

  @override
  String get obtainLabel => 'Obtener';

  @override
  String get rewardsNoFoundTitleLabel => 'Actualmente no existen nuevas recompensas disponibles';

  @override
  String get rewardsNoFoundDescriptionLabel => 'Está atento que próximamente habrán nuevas recompensas para ti';

  @override
  String get noNewCommercesDescriptionLabel => 'Está atento que próximamente habrán nuevos comercios para ti';

  @override
  String get scanHeaderLabel => 'Escanea y listo';

  @override
  String get claimRewardCodeGeneratedLabel => '¡Ya casi reclamas tu premio!';

  @override
  String get claimRewardCodeGeneratedDescriptionLabel => 'Dirígete a la caja del comercio y presenta el siguiente código para poder canjear tu recompensa';

  @override
  String get discountRewardTypeLabel => 'Recompensa de Descuento';

  @override
  String get dollarRewardTypeLabel => 'Recompensa en Efectivo';

  @override
  String get countOrdinalCardRepetitionFirst => "ra";

  @override
  String get countOrdinalCardRepetitionSecond => "da";

  @override
  String get countOrdinalCardRepetitionThird => "ra";

  @override
  String get countOrdinalCardRepetitionOther => "ta";

  @override
  String get countOrdinalCardRepetitionSeven => "ma";

  @override
  String get countOrdinalCardRepetitionEight => "va";

  @override
  String get countOrdinalCardRepetitionNine => "na";

  @override
  String countOrdinalCardRepetitionLabel(Object ordinalNumber) {
    return "Esta es tu $ordinalNumber vez coleccionando esta tarjeta";
  }

  @override
  String get tooltipPendingLabel => "pendiente";

  @override
  String get tooltipCompletedLabel => "reclamado";

  @override
  String get tooltipUnclaimedLabel => "disponible";

  @override
  String get tooltipStampLabel => "Sello";

  @override
  String get tooltipRewardLabel => "Premio";
}
