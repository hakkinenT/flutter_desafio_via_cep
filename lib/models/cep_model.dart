import 'package:json_annotation/json_annotation.dart';

part 'cep_model.g.dart';

@JsonSerializable()
class CepModel {
  final String? objectId;
  final String cep;
  final String logradouro;
  final String? complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    this.objectId,
    this.complemento,
    this.createdAt,
    this.updatedAt,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) =>
      _$CepModelFromJson(json);

  Map<String, dynamic> toJson() => _$CepModelToJson(this);

  CepModel copyWith({
    String? cep,
    String? logradouro,
    String? bairro,
    String? localidade,
    String? uf,
    String? objectId,
    String? complemento,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CepModel(
      objectId: objectId ?? this.objectId,
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      bairro: bairro ?? this.bairro,
      complemento: complemento ?? this.complemento,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
