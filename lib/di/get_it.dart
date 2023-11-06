import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sliding_navbar/blocs/home_bloc/home_bloc.dart';
import 'package:sliding_navbar/graphql/client.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // GraphQL client setup
  getIt.registerSingleton<ApiService>(ApiService());

  // BLoC setup
  getIt.registerFactory(() => HomeBloc(apiService: getIt<ApiService>()));
}
