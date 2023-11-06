part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class Loading extends HomeState {}

class HomeBannerListResult extends HomeState {
  final List<BannerMedia> list;

  HomeBannerListResult({required this.list});
  }
  class ErrorLoad extends HomeState{
  final String error;
  ErrorLoad({required this.error});
  }