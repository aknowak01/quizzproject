import 'package:quizzproject/infra/dto/test_get_all/response/test_get_all_response.dart';
import 'package:quizzproject/infra/dto/test_get_details/response/test_get_details_response.dart';
import 'package:quizzproject/infra/repository/local_test_repository.dart';
import 'package:quizzproject/infra/repository/test_repository.dart';
import 'package:quizzproject/shared/models/test/test_details_model.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';

class TestService {
  final TestRepository _testRepository = TestRepository();
  final LocalTestRepository _localTestRepository = LocalTestRepository();

  Future<List<TestModel>> getAllTests() async {
    try {
      TestGetAllResponse testGetAllResponse = await _testRepository.getAllTests();
      _localTestRepository.saveAllTests(testGetAllResponse);
      List<TestModel> tests = testGetAllResponse.testList.map((e) => TestModel.fromDto(e)).toList();
      return tests;
    } catch (e) {
      TestGetAllResponse testGetAllResponse = await _localTestRepository.getAllTests();
      List<TestModel> tests = testGetAllResponse.testList.map((e) => TestModel.fromDto(e)).toList();
      return tests;
    }
  }

  Future<TestDetailsModel> getTestDetails(String id) async {
    try {
      TestGetDetailsResponse testGetDetailsResponse = await _testRepository.getTestDetails(id);
      _localTestRepository.saveTestDetails(testGetDetailsResponse);
      TestDetailsModel testDetails = TestDetailsModel.fromDto(testGetDetailsResponse);
      return testDetails;
    } catch (e) {
      TestGetDetailsResponse testGetDetailsResponse = await _localTestRepository.getTestDetails(id);
      TestDetailsModel testDetails = TestDetailsModel.fromDto(testGetDetailsResponse);
      return testDetails;
    }
  }
}
