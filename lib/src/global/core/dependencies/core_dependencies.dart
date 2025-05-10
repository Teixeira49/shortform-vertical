// ignore_for_file: strict_raw_type

import '../../../modules/auth/data/data_source/remote/auth_api.dart';
import '../../../modules/auth/data/data_source/remote/auth_api_rest.dart';
import '../../../modules/auth/data/repositories_impl/auth_repository.dart';
import '../../../modules/auth/domain/repositories/auth_repository.dart';
import '../../../modules/home/data/data_source/remote/media_api.dart';
import '../../../modules/home/data/data_source/remote/media_api_rest.dart';
import '../../../modules/home/data/repositories_impl/media_repository.dart';
import '../../../modules/home/domain/repositories/media_repository.dart';
import '../../../modules/profile/data/data_source/remote/profile_api.dart';
import '../../../modules/profile/data/data_source/remote/profile_api_rest.dart';
import '../../../modules/profile/data/repositories_impl/profile_repository.dart';
import '../../../modules/profile/domain/repositories/profile_repository.dart';
import '../../../shared/features/data_source/device_storage/device_storage_api.dart';
import '../../../shared/features/data_source/device_storage/device_storage_flutter_secure.dart';
import '../../../shared/features/data_source/user_api/user_api.dart';
import '../../../shared/features/data_source/user_api/user_api_rest.dart';
import '../../../shared/features/repositories/repositories.dart';
import '../../../shared/features/repositories_impl/repositories_impl.dart';
import 'base_module_dependencies.dart';

class CoreDependencies implements BaseModuleDependencies {
  CoreDependencies({
    required this.authRepository,
    required this.userRepository,
    required this.mediaRepository,
    required this.profileRepository,
  });

  /// Handy method to reuse a base [CoreDependencies] constructor
  /// for every environment.
  factory CoreDependencies._({
    required String authApiUrl,
    required String userApiUrl,
    required String mediaApiUrl,
    required String profileApiUrl,
  }) {
    late final IAuthApi authApi;
    late final IUserApi userApi;
    late final IMediaApi mediaApi;
    late final IDeviceStorageApi secureStorage;
    late final IProfileApi profileApi;

    authApi = AuthApiRest(apiUrl: authApiUrl);
    userApi = UserApiRest(apiUrl: userApiUrl);
    mediaApi = MediaApiRest(apiUrl: mediaApiUrl);
    secureStorage = const FlutterSecureStorageApi();
    profileApi = ProfileApiRest(apiUrl: profileApiUrl);

    return CoreDependencies(
      authRepository: AuthRepository(authApi: authApi, storage: secureStorage),
      userRepository: UserRepository(userApi: userApi,),
      mediaRepository: MediaRepository(mediaApi: mediaApi),
      profileRepository: ProfileRepository(
        profileApi: profileApi,
        storage: secureStorage,
      ),
    );
  }

  factory CoreDependencies.development({
    required String authApiUrl,
    required String userApiUrl,
    required String mediaApiUrl,
    required String profileApiUrl,
  }) {
    return CoreDependencies._(
      authApiUrl: authApiUrl,
      userApiUrl: userApiUrl,
      mediaApiUrl: mediaApiUrl,
      profileApiUrl: profileApiUrl,
    );
  }

  factory CoreDependencies.production({
    required String authApiUrl,
    required String userApiUrl,
    required String mediaApiUrl,
    required String profileApiUrl,
  }) {
    return CoreDependencies._(
      authApiUrl: authApiUrl,
      userApiUrl: userApiUrl,
      mediaApiUrl: mediaApiUrl,
      profileApiUrl: profileApiUrl,
    );
  }

  final IAuthRepository authRepository;
  final IUserRepository userRepository;
  final IMediaRepository mediaRepository;
  final IProfileRepository profileRepository;

  @override
  List<RepositoryProvider> repositoryProviders() {
    return [
      RepositoryProvider<IAuthRepository>(create: (context) => authRepository),
      RepositoryProvider<IUserRepository>(create: (context) => userRepository),
      RepositoryProvider<IMediaRepository>(
        create: (context) => mediaRepository,
      ),
      RepositoryProvider<IProfileRepository>(
        create: (context) => profileRepository,
      ),
    ];
  }
}
