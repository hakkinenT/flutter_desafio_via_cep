import 'package:flutter/material.dart';

import '../../controllers/cep_controller.dart';
import '../../models/cep_model.dart';
import '../widgets/cep_empty_list.dart';
import '../widgets/cep_information_expansion_tile.dart';
import '../widgets/cep_loading_indicator.dart';
import '../widgets/cep_not_found.dart';
import '../widgets/search_cep_bar.dart';
import 'cep_information_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CepController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await controller.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePageBody(
        slivers: [
          SliverToBoxAdapter(
            child: ListenableBuilder(
              listenable: controller,
              builder: (context, child) {
                return SearchCepBar(
                  initialValue: controller.cep,
                  onChanged: (value) {
                    controller.setCep(value);
                  },
                  onSearchButtonPressed: () async {
                    await controller.searchCep();
                    final cep = controller.cepModel;

                    if (mounted) {
                      if (controller.error) {
                        await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (ctx) {
                              return AlertDialog(
                                content: CepNotFound(
                                    message: controller.errorMessage!),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      controller.clearErrorFields();
                                      controller.clearCep();

                                      Navigator.pop(context);
                                    },
                                    child: const Text('Fechar'),
                                  ),
                                ],
                              );
                            });
                      } else {
                        _showCepInformations(cep);
                      }
                    }
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: _HeightSpacer(),
          ),
          ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              final ceps = controller.ceps;

              if (controller.loading) {
                return const SliverToBoxAdapter(
                  child: CepLoadingIndicator(),
                );
              } else if (controller.ceps.isEmpty) {
                return const SliverToBoxAdapter(
                  child: CepEmptyList(),
                );
              } else {
                return SliverList.builder(
                  itemCount: ceps.length,
                  itemBuilder: (context, index) {
                    final cep = ceps[index];
                    return CepInformationExpansionTile(
                      cep: cep,
                      onTap: () {},
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showCepInformations(CepModel cep) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            content: CepInformationContainer(cep: cep),
            actions: [
              TextButton(
                onPressed: () async {
                  await controller.getAll();
                  controller.clearCep();
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Fechar'),
              ),
            ],
          );
        });
  }
}

class _HeightSpacer extends StatelessWidget {
  const _HeightSpacer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({this.slivers = const <Widget>[]});

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomScrollView(
          slivers: slivers,
        ),
      ),
    );
  }
}
