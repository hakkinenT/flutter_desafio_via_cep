import 'package:flutter/material.dart';
import 'package:flutter_desafio_via_cep/models/cep_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/bairro_information.dart';
import '../widgets/cep_information.dart';
import '../widgets/complemento_information.dart';
import '../widgets/localidade_information.dart';
import '../widgets/logradouro_information.dart';
import '../widgets/uf_information.dart';

class CepInformationContainer extends StatelessWidget {
  const CepInformationContainer({super.key, required this.cep});

  final CepModel cep;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 56.0),
          width: 200,
          height: 260,
          child: Column(
            children: [
              CepInformation(cep: cep),
              LogradouroInformation(cep: cep),
              BairroInformation(cep: cep),
              ComplementoInformation(cep: cep),
              LocalidadeInformation(cep: cep),
              UFInformation(cep: cep),
            ],
          ),
        ),
        Positioned(
          bottom: 230,
          child: SvgPicture.asset(
            'assets/images/current-location.svg',
            width: 100,
            height: 100,
          ),
        )
      ],
    );
  }
}
