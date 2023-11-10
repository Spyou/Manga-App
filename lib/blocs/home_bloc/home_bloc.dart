import 'package:bloc/bloc.dart';
import 'package:manga_app/utils/response/response.dart';
import 'package:meta/meta.dart';

import '../../graphql/client.dart';
import '../../model/banner_model.dart';
import '../../model/anime_item_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc({required this.apiService}) : super(HomeInitial()) {
    on<OnInitHomeEvent>((event, emit) async {
      emit(Loading());
      try{
        var recentlyList  =  await apiService.getRecentlyList();
        var  bannerList =  await  apiService.getBanners();
        var  trendingList =  await  apiService.getTrendingList();
        if(recentlyList.isEmpty||bannerList.isEmpty||trendingList.isEmpty){
          print(':asdasdasd');
          emit(ErrorLoad(error: "Error Loadded"));

        }
        else{
          emit(HomeFetchResult(recentlyList,bannerList,trendingList));

        }
      }
      catch(e){
        print(':asdasdasd');
        print(e.toString());


        emit(ErrorLoad(error: "error"));
      }

    });
  }
}
