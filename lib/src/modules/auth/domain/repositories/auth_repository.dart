import 'package:venetiktok/src/modules/auth/domain/entities/entities.dart';

abstract class IAuthRepository {
  /// Returns the stored authentication token, or `null` if no token is stored.
  Future<String?> getCurrentToken();

  /// Sign up a user with the given [params].
  ///
  ///
  /// **Parameters:**
  /// - `params` - A [SignUpUserParams] with the params to sign up a user.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> signUpUser({required SignUpUserParams params});

  /// Sign in a user with the given [params].
  ///
  /// **Parameters:**
  /// - `params` - A [SignInUserParams] with the params to sign in a user.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> signInUser({required SignInUserParams params});

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
