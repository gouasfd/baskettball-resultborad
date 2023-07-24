import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resultboard/bloc/conter_increament.dart';

class Cubitconter extends Cubit<Counter> {
  int point = 0;

  Cubitconter() : super(IncreamentA());
  void changeconter(int buttomtab,String team) {
    
    point += buttomtab;
    emit(IncreamentA());
    emit(IncreamentB());
  }
}
