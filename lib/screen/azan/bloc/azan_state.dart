import 'package:zikr_uz/data/model/azan/azan_model.dart';

abstract class AzanState {}

class InitialTodayAzanState extends AzanState {}

class LoadTodayAzanInProgress extends AzanState {}

class LoadTodayAzanInSuccess extends AzanState {
  final TodayAzanModel todayAzanModel;
 
  LoadTodayAzanInSuccess({required this.todayAzanModel});
}

class LoadTodayAzanInFairlure extends AzanState {
  final String errorText;
 
  LoadTodayAzanInFairlure({required this.errorText});
}

