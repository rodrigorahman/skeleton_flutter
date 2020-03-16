import 'package:dio/dio.dart';
import 'package:lista_loader/model/endereco_model.dart';

class EnderecoRepository {
  Future<List<EnderecoModel>> buscarEndereco() {
    var dio = Dio();
    return dio
        .get('https://viacep.com.br/ws/SP/S%C3%A3o%20Paulo/paulista/json/')
        .then((res) {
      return res.data
          .map<EnderecoModel>((end) => EnderecoModel.fromMap(end))
          .toList();
    }).then((data) async {
      await Future.delayed(Duration(seconds: 3));
      return data;
    });
  }
}
