import 'package:cep_flutter/models/viacep_model.dart';
import 'package:cep_flutter/service/cep_service.dart';
import 'package:flutter/material.dart';

class CepListPage extends StatefulWidget {
  final CEPService cepService;
  const CepListPage(this.cepService, {super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {
  List<ViaCepModel> ceps = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCEPs();
  }

  Future<void> fetchCEPs() async {
    final cepList = await widget.cepService.fetchAllCEPs();
    setState(() {
      ceps = cepList;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEP List'),
      ),
      body: ListView.builder(
        itemCount: ceps.length,
        itemBuilder: (context, index) {
          final cep = ceps[index];
          return ListTile(
            title: Text('CEP: ${cep.cep} - Localidade: ${cep.localidade}'),
          );
        },
      ),
    );
  }
}
