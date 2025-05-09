import '../../models/params/delete_account_params_model.dart';

abstract class IProfileApi {
  /// Delete Account of the current user.
  ///
  /// **Parameters:**
  /// - `userId` - An instance of [DeleteAccountParamsModel] containing the user id.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> deleteAccount({required DeleteAccountParamsModel params});
}
