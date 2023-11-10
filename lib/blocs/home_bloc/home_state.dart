part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Loading extends HomeState {}
class HomeFetchResult extends HomeState{
   List<AnimeSmallModel> recentlyList;
   List<BannerData> bannerList;
   List<AnimeSmallModel> trendingList;

  HomeFetchResult(this.recentlyList, this.bannerList,this.trendingList);
}

class ErrorLoad extends HomeState {
  final String error;
  ErrorLoad({required this.error});
}
