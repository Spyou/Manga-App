part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class InitialHome extends HomeEvent {}
class OnInitHomeEvent extends HomeEvent{}
class OnErrorEvent extends HomeEvent{}
