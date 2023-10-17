import 'package:flutter/material.dart';

class CepErrorMessage extends StatelessWidget {
  const CepErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return _CepErrorMessageBody(
      child: Text(message),
    );
  }
}

class _CepErrorMessageBody extends StatelessWidget {
  const _CepErrorMessageBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
