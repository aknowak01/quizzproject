import 'package:dio/dio.dart';
import 'package:quizzproject/infra/dto/test_get_all/response/test_get_all_response.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/test_get_details_response.dart';

class TestRepository {
  final Dio webClient = Dio(BaseOptions(baseUrl: 'https://tgryl.pl'));

  Future<TestGetAllResponse> getAllTests() async {
    Response<dynamic> response = await webClient.get('/quiz/tests');
    List<dynamic> responseData = response.data as List<dynamic>;
    return TestGetAllResponse.fromJsonList(responseData);
  }

  Future<TestGetDetailsResponse> getTestDetails(String id) async {
    Response<dynamic> response = await webClient.get('/quiz/test/$id');
    Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
    return TestGetDetailsResponse.fromJson(responseData);
  }
}
