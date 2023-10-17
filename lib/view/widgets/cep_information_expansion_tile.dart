import 'package:flutter/material.dart';

import '../../models/cep_model.dart';
import 'bairro_information.dart';
import 'complemento_information.dart';
import 'logradouro_information.dart';

class CepInformationExpansionTile extends StatelessWidget {
  const CepInformationExpansionTile({
    super.key,
    required this.cep,
    required this.onTap,
  });

  final CepModel cep;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _CepInformationBody(
      title: Text('${cep.localidade}/${cep.uf}'),
      subtitle: Text(
        cep.cep,
        style: const TextStyle(color: Colors.black54),
      ),
      leading: Icon(
        Icons.location_on,
        color: Colors.red[400],
      ),
      onTap: onTap,
      children: [
        LogradouroInformation(cep: cep),
        BairroInformation(cep: cep),
        ComplementoInformation(cep: cep),
      ],
    );
  }
}

class _CepInformationBody extends StatelessWidget {
  const _CepInformationBody(
      {required this.title,
      this.subtitle,
      this.leading,
      this.children = const <Widget>[],
      required this.onTap});

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final List<Widget> children;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ExpansionTile(
        shape: const Border(),
        title: title,
        leading: leading,
        subtitle: subtitle,
        childrenPadding: const EdgeInsets.all(16.0),
        children: children,
      ),
    );
  }
}
