import '../../models/models.dart';

abstract class IAuthApi {
  /// Sign up a user with the given [params].
  ///
  /// **Parameters:**
  /// - `params` - A [SignUpUserParamsModel] with the params to sign up a user.
  ///
  /// **Returns:**
  /// - A [Future] of [String] with the user token.
  Future<String> signUpUser({required SignUpUserParamsModel params});

  /// Sign in a user with the given [params].
  ///
  /// **Parameters:**
  /// - `params` - A [SignInUserParamsModel] with the params to sign in a user.
  ///
  /// **Returns:**
  /// - A [Future] of [String] with the user token.
  Future<String> signInUser({required SignInUserParamsModel params});

  /// Send a forgot password email to the user with the given [email].
  ///
  /// **Parameters:**
  /// - `email` - A [String] with the email to send the forgot password email.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> forgotPassword({required String email});

  /// Sign out the current user.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> signOut();
}
