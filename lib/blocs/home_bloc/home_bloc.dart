import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../graphql/client.dart';
import '../../model/banner_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<GetBannerListEvent>((event, emit) async {
      emit(Loading());
      var state = await apiService.getBanners();
      emit(state);
    });
  }
}
