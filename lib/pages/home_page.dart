import 'package:cep_flutter/models/viacep_model.dart';
import 'package:cep_flutter/pages/cep_list_page.dart';

import 'package:cep_flutter/service/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CEPService cepService = CEPService();
  final TextEditingController cepController = TextEditingController();
  ViaCepModel? cepResult;
  List<ViaCepModel> ceps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Buscar Cep"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                controller: cepController,
                decoration: const InputDecoration(labelText: 'Digite o CEP'),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final enteredCEP = cepController.text;
                final result = await cepService.searchCEP(enteredCEP);
                print(result);
                if (result != null) {
                  print('CEP found: ${result.cep} - ${result.localidade}');
                } else {
                  print('CEP not found in ViaCEP.');
                  await cepService.createCEPInBack4App(ViaCepModel(
                    cep: enteredCEP,
                    logradouro: result?.logradouro,
                    complemento: result?.complemento,
                    bairro: result?.bairro,
                    localidade: result?.localidade,
                    uf: result?.uf,
                    ibge: result?.ibge,
                    gia: result?.gia,
                    ddd: result?.ddd,
                    siafi: result?.siafi,
                  ));
                }

                // Navigate to the CEP list page
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CepListPage(cepService);
                }));
              },
              child: Text('Buscar CEP'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchCEPs() async {
    final cepList = await cepService.fetchAllCEPs();
    setState(() {
      ceps = cepList;
    });
  }
}
