import 'package:zikr_uz/data/model/azan/Timings.dart';
import 'package:zikr_uz/data/model/azan/date_model.dart';

class DataModel {
  Timings timings;
  Date date;


  DataModel({
    required this.timings,
    required this.date,

  });

  factory DataModel.fromJson(Map<String, dynamic> jsonData) {
    return DataModel(
      timings: Timings.fromJson(jsonData['timings']),
      date: Date.fromJson(jsonData['date'])

    );
  }
}