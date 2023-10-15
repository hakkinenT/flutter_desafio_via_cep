// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CepModel _$CepModelFromJson(Map<String, dynamic> json) => CepModel(
      cep: json['cep'] as String,
      logradouro: json['logradouro'] as String,
      bairro: json['bairro'] as String,
      localidade: json['localidade'] as String,
      uf: json['uf'] as String,
      objectId: json['objectId'] as String?,
      complemento: json['complemento'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CepModelToJson(CepModel instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
