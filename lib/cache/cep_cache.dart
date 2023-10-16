import 'package:flutter_desafio_via_cep/cache/exceptions/cache_exception.dart';
import 'package:flutter_desafio_via_cep/utils/network/custom_dio/cep_cache_custom_dio.dart';

import '../utils/constants/api.dart';
import '../utils/constants/methods.dart';

class CepCache {
  final custom = CepCacheCustomDio();

  Future<void> save(Map<String, dynamic> json) async {
    try {
      await custom.dio.post(url, data: json);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      final result = await custom.dio.get(url);
      final list = result.data['results'] as List;
      return list.map((e) => convertToMap(e)).toList();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<Map<String, dynamic>> get(String cep) async {
    try {
      final filter = '$url?where={"cep":"$cep"}';
      final result = await custom.dio.get(filter);
      final data = result.data['results'][0];
      return convertToMap(data);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> remove(String id) async {
    try {
      await custom.dio.delete('$url/$id');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> update(String id, Map<String, dynamic> json) async {
    try {
      await custom.dio.put('$url/$id', data: json);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
