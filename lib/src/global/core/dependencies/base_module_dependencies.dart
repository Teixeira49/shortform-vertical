// ignore_for_file: strict_raw_type

import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseModuleDependencies {
  /// Returns a list of [RepositoryProvider]s that must be injected for this
  /// module.
  List<RepositoryProvider> repositoryProviders();
}
