import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_event.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {

 QuranBloc() : super(QuranInitial()) {
  on<GetPage>(_fetchQuranPage);
 }

 _fetchQuranPage(GetPage event, Emitter<QuranState> emit) async {
      if(event.quranPage > 0) {
        emit(QuransLoadInSuccess(quranPage: event.quranPage,index: event.index));
      } 
 }

}