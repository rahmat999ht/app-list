import 'package:get/get.dart';

class ListProvider extends GetConnect {
  // baseUrl
  final String baseURL = 'https://jsonplaceholder.typicode.com';

  Future<Response> fetchList() async {
    const String urlPhotos = '/photos';
    return get(urlPhotos);
  }

  Future<Response> deleteList(int id) async {
    final String urlPhotos = '/photos?id=$id';
    return delete(urlPhotos);
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseURL;
    super.onInit();
  }
}
