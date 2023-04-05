import 'package:zikr_uz/data/model/my_respon/my_response.dart';
import 'package:zikr_uz/service/api/api_service.dart';

class AzanRepo{
  ApiService apiService;
  AzanRepo({required this.apiService});


  Future<MyResponse> gatAzan() => apiService.getAzan(); 
  Future<MyResponse> gatTodayAzan() => apiService.getTodayAzan(); 

 
  


}