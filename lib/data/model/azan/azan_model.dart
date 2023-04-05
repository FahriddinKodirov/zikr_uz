import 'package:zikr_uz/data/model/azan/data_model.dart';

class AzanModel {
  int code;
  String status;
  List<DataModel> data;

  AzanModel({
    required this.code,
    required this.status,
    required this.data,
  });

factory AzanModel.fromJson(Map<String, dynamic> jsonData){
  return AzanModel(
    code: jsonData['code'] as int? ?? 0,
    status: jsonData['status'] as String? ?? '',
    data: (jsonData['data'] as List).map((json) => DataModel.fromJson(json)).toList()
    );
}
}


class TodayAzanModel {
  int code;
  String status;
  DataModel data;

  TodayAzanModel({
    required this.code,
    required this.status,
    required this.data,
  });

factory TodayAzanModel.fromJson(Map<String, dynamic> jsonData){
  return TodayAzanModel(
    code: jsonData['code'] as int? ?? 0,
    status: jsonData['status'] as String? ?? '',
    data: DataModel.fromJson(jsonData['data'])

    );
}
}