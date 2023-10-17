import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class SearchCepBar extends StatelessWidget {
  const SearchCepBar(
      {super.key,
      required this.onChanged,
      required this.onSearchButtonPressed,
      this.initialValue});

  final ValueChanged<String> onChanged;
  final VoidCallback onSearchButtonPressed;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return _SearchCepBarBody(children: [
      Expanded(
        child: CustomTextFormField(
          initialValue: initialValue,
          hintText: 'Pesquisar CEP...',
          onChanged: onChanged,
        ),
      ),
      _SearchButton(onSearchButtonPressed: onSearchButtonPressed),
    ]);
  }
}

class _SearchCepBarBody extends StatelessWidget {
  const _SearchCepBarBody({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: children,
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    required this.onSearchButtonPressed,
  });

  final VoidCallback onSearchButtonPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onSearchButtonPressed,
      icon: const Icon(Icons.search),
    );
  }
}
