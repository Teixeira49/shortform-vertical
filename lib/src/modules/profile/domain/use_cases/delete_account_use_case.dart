import 'package:venetiktok/src/modules/profile/domain/entities/params/delete_account_params.dart';

import '../repositories/profile_repository.dart';

class DeleteUserUseCase {
  DeleteUserUseCase({
    required IProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  final IProfileRepository _profileRepository;

  /// Sign out the current user.
  ///
  /// **Parameters:**
  /// - `params` - An instance of [DeleteAccountParams] containing the user id.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> execute({required DeleteAccountParams params}) async {
    try {
      return await _profileRepository.deleteAccount(params: params);
    } catch (e) {
      rethrow;
    }
  }
}
