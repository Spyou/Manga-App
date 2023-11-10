
import 'package:flutter/cupertino.dart';

@immutable
abstract class ResponseState{
}


class Loading extends ResponseState {}

class SuccessResponse<T> extends ResponseState {
  List<T> list;

  SuccessResponse({required this.list});
}

class Error extends ResponseState {
  final String error;
  Error({required this.error});
}
