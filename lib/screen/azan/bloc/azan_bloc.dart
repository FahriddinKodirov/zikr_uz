import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/model/my_respon/my_response.dart';
import 'package:zikr_uz/data/repository/azan_repo.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_event.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_state.dart';

class AzanBloc extends Bloc<AzanEvent, AzanState> {
 final AzanRepo azanRepo;

 AzanBloc(this.azanRepo):super(InitialTodayAzanState()) {
  on<FetchSingleAzan>(_fetchTodatAzan);
 }

 _fetchTodatAzan(FetchSingleAzan event, Emitter<AzanState> emit) async {
  emit(LoadTodayAzanInProgress());

  MyResponse myResponse = await azanRepo.gatTodayAzan();
  if(myResponse.error.isEmpty){
    emit(LoadTodayAzanInSuccess(todayAzanModel: myResponse.data));
  } else {
    emit(LoadTodayAzanInFairlure(errorText: myResponse.error));
  }
 }
}