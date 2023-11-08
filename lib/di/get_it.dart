import 'package:get_it/get_it.dart';
import 'package:manga_app/graphql/client.dart';

import '../blocs/home_bloc/home_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // GraphQL client setup
  getIt.registerSingleton<ApiService>(ApiService());

  // BLoC setup
  getIt.registerFactory(() => HomeBloc(apiService: getIt<ApiService>()));
}
