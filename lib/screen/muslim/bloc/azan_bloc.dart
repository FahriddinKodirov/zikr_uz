import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/model/my_respon/my_response.dart';
import 'package:zikr_uz/data/repository/azan_repo.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_event.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_state.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_event.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_state.dart';

class ListAzanBloc extends Bloc<ListAzanEvent, ListAzanState> {
 final AzanRepo azanRepo;

 ListAzanBloc(this.azanRepo):super(InitialListAzanState()) {
  on<FetchAllAzan>(_fetchAzan);
 }


 _fetchAzan(FetchAllAzan event, Emitter<ListAzanState> emit) async {
  emit(LoadAzanInProgress());

  MyResponse myResponse = await azanRepo.gatAzan();
  if(myResponse.error.isEmpty){
    emit(LoadAzanInSuccess(azanModel: myResponse.data));
  } else {
    emit(LoadAzanInFairlure(errorText: myResponse.error));
  }
 }
 
}