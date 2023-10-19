import 'package:cep_flutter/models/ceps_back4app_model.dart';
import 'package:dio/dio.dart';

class CepBack4AppRepository {
  Future<CepBack4AppModel> obterCeps() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP";
    dio.options.headers["Content-Type"] = "application/json";
    var result = await dio.get("https://parseapi.back4app.com/classes/Ceps");
    return CepBack4AppModel.fromJson(result.data);
  }

  Future<void> criarCep(CepBack4AppModel cep) async {
    try {
      var dio = Dio();
      dio.options.headers["X-Parse-Application-Id"] =
          "FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ";
      dio.options.headers["X-Parse-REST-API-Key"] =
          "rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP";
      dio.options.headers["Content-Type"] = "application/json";
      await dio.post("https://parseapi.back4app.com/classes/Ceps",
          data: cep.toJson());
    } catch (e) {
      throw Exception("Erro ao criar o CEP: $e");
    }
  }

  Future<void> atualizarCep(String objectId, CepBack4AppModel cep) async {
    try {
      var dio = Dio();
      dio.options.headers["X-Parse-Application-Id"] =
          "FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ";
      dio.options.headers["X-Parse-REST-API-Key"] =
          "rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP";
      dio.options.headers["Content-Type"] = "application/json";
      await dio.put("https://parseapi.back4app.com/classes/Ceps/$objectId",
          data: cep.toJson());
    } catch (e) {
      throw Exception("Erro ao atualizar o CEP: $e");
    }
  }

  Future<void> excluirCep(String objectId) async {
    try {
      var dio = Dio();
      dio.options.headers["X-Parse-Application-Id"] =
          "FJioa6Y7Xxt2Hq3zk14eT7b4PUJ7bjL3C0Qw3IkQ";
      dio.options.headers["X-Parse-REST-API-Key"] =
          "rBA3czEO0VHuzaiv8SuYLguafyQguZ0jgFsoCinP";
      dio.options.headers["Content-Type"] = "application/json";
      await dio.delete("https://parseapi.back4app.com/classes/Ceps/$objectId");
    } catch (e) {
      throw Exception("Erro ao excluir o CEP: $e");
    }
  }
}
