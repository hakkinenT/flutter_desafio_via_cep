import 'package:flutter/material.dart';

class CepInformationExpansionItem extends StatelessWidget {
  const CepInformationExpansionItem(
      {super.key, required this.label, required this.content});

  final String label;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: style,
        ),
        const Spacer(),
        Text(_getCep()),
      ],
    );
  }

  final TextStyle style = const TextStyle(fontWeight: FontWeight.bold);

  String _getCep() {
    if (content == null || content!.isEmpty) {
      return 'N/A';
    }

    return content!;
  }
}
