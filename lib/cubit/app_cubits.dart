import 'package:bloc/bloc.dart';
import 'package:slider_app_flutter/cubit/app_cubit_states.dart';

class AppCubits extends Cubit <CubitStates>{
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
