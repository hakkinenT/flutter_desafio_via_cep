import 'package:dio/dio.dart';
import 'package:flutter_desafio_via_cep/utils/constants/methods.dart';

class CepService {
  final dio = Dio();

  Future<Map<String, dynamic>> get(String cep) async {
    final result = await dio.get('https://viacep.com.br/ws/$cep/json/');
    return convertToMap(result.data);
  }
}
