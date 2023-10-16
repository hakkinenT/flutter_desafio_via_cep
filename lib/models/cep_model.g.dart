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
