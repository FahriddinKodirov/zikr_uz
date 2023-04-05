import 'package:dio/dio.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/data/model/my_respon/my_response.dart';
import 'package:zikr_uz/service/api/api_client.dart';

class ApiService extends ApiClient {

 Future<MyResponse> getAzan() async {
    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response =
          await dio.get('${dio.options.baseUrl}/calendar/${DateTime.now().year}/${DateTime.now().month}',queryParameters: {
            'latitude': '41.311081',
            'longitude': '69.240562',
          });
      if (response.statusCode == 200) {
        myResponse.data = AzanModel.fromJson(response.data);

      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }

   Future<MyResponse> getTodayAzan() async {
    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response =
          await dio.get('${dio.options.baseUrl}/timings/${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',queryParameters: {
            'latitude': '41.311081',
            'longitude': '69.240562',
          });
      if (response.statusCode == 200) {
        myResponse.data = TodayAzanModel.fromJson(response.data);

      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
