import 'package:bloc/bloc.dart';
import 'package:slider_app_flutter/cubit/app_cubit_states.dart';
import 'package:slider_app_flutter/pages/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getINfo();
      emit(LoadedState(places));
    } catch (e) {}
  }
}
