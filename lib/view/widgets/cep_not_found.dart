import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CepNotFound extends StatelessWidget {
  const CepNotFound({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          width: 150,
          height: 80,
          child: Center(
              child: Text(
            message,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
        ),
        Positioned(
          bottom: 75,
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
