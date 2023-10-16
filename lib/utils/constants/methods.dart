Map<String, dynamic> convertToMap(dynamic data) {
  return {
    'objectId': data['objectId'].toString(),
    'cep': data['cep'].toString(),
    'logradouro': data['logradouro'].toString(),
    'complemento': data['complemento'].toString(),
    'bairro': data['bairro'].toString(),
    'localidade': data['localidade'].toString(),
    'uf': data['uf'].toString(),
    'createdAt': data['createdAt'].toString(),
    'updatedAt': data['updatedAt'].toString()
  };
}
