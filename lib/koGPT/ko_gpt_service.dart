import 'package:dio/dio.dart';

class KoGPTService {
  Future<Map<String, dynamic>> search(String prompt) async {
    print(prompt);
    try {
      // KoGPT API의 URL과 요청 데이터 구성
      const String apiUrl = 'https://api.kakaobrain.com/v1/inference/kogpt/generation';
      final Map<String, dynamic> requestData = {
        'prompt': prompt,
        'max_tokens': 150,
        'temperature': 1.0,
        'top_p': 1.0
      };

      // Dio 인스턴스 생성
      final dio = Dio();

      // Dio를 사용하여 POST 요청 보내기
      final Response response = await dio.post(
        apiUrl,
        data: requestData,
        options: Options(
          headers: {
            'Authorization': 'KakaoAK 9b47feeef38b96cbd7ef8a7f282dfe81', // 여기에 자신의 REST API 키를 넣어주세요
            'Content-Type': 'application/json',
          },
        ),
      );

      // 응답 데이터 반환
      print(response.data);
      return response.data;
    } catch (e) {
      print('Error in KoGPTService: $e');
      return {}; // 오류가 발생하면 빈 Map을 반환하거나, 다른 적절한 값을 반환할 수 있습니다.
    }
  }
}
