import 'package:zikr_uz/data/model/azan/azan_model.dart';

abstract class ListAzanState {}

class InitialListAzanState extends ListAzanState {}

class LoadAzanInProgress extends ListAzanState {}

class LoadAzanInSuccess extends ListAzanState {
  final AzanModel azanModel;
 
  LoadAzanInSuccess({required this.azanModel});
}

class LoadAzanInFairlure extends ListAzanState {
  final String errorText;
 
  LoadAzanInFairlure({required this.errorText});
}



