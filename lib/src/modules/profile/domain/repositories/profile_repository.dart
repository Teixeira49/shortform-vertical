import 'package:venetiktok/src/modules/profile/domain/entities/params/delete_account_params.dart';

abstract class IProfileRepository {
  /// Delete the current user.
  ///
  /// **Parameters:**
  /// - `params` - An instance of [DeleteAccountParams] containing the user id.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> deleteAccount({required DeleteAccountParams params});
}
