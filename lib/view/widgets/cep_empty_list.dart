import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CepEmptyList extends StatelessWidget {
  const CepEmptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EmptyLocationImage(),
        _EmptyMessageTitle(),
        _EmptyMessageContent(),
      ],
    );
  }
}

class _EmptyMessageContent extends StatelessWidget {
  const _EmptyMessageContent();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Pesquise um CEP para começar',
      style: _style(context),
    );
  }

  TextStyle _style(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}

class _EmptyMessageTitle extends StatelessWidget {
  const _EmptyMessageTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Não há nada aqui!',
      style: _style(context),
    );
  }

  TextStyle _style(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class _EmptyLocationImage extends StatelessWidget {
  const _EmptyLocationImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Lottie.asset('assets/images/location.json'),
    );
  }
}
