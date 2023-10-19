import 'package:cep_flutter/models/viacep_model.dart';
import 'package:dio/dio.dart';

class CEPService {
  final Dio _dio = Dio();

  Future<List<ViaCepModel>> fetchAllCEPs() async {
    try {
      final response =
          await _dio.get('https://parseapi.back4app.com/classes/CEP',
              options: Options(
                headers: {
                  'X-Parse-Application-Id':
                      'FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ',
                  'X-Parse-REST-API-Key':
                      'rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP',
                },
              ));
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        return data.map((item) => ViaCepModel.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error fetching CEPs: $e');
    }
    return [];
  }

  Future<ViaCepModel?> searchCEP(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200) {
        final data = response.data;
        return ViaCepModel.fromJson(data);
      }
    } catch (e) {
      print('Error searching CEP: $e');
    }
    return null;
  }

  Future<void> createCEPInBack4App(ViaCepModel cepModel) async {
    try {
      final response = await _dio.post(
        'https://parseapi.back4app.com/classes/CEP',
        data: cepModel.toJson(),
        options: Options(
          headers: {
            'X-Parse-Application-Id':
                'FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ',
            'X-Parse-REST-API-Key': 'rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        print('CEP created in Back4App');
      }
    } catch (e) {
      print('Error creating CEP in Back4App: $e');
    }
  }

  Future<void> deleteCEP(String objectId) async {
    final response = await _dio.delete(
      'https://parseapi.back4app.com/classes/CEP/$objectId',
      options: Options(
        headers: {
          'X-Parse-Application-Id': 'FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ',
          'X-Parse-REST-API-Key': 'rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP',
        },
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete CEP');
    }
  }
}
