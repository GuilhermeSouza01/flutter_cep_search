// import 'package:cep_flutter/models/ceps_back4app_model.dart';
// import 'package:cep_flutter/service/dio_api_service.dart';
// import 'package:flutter/material.dart';

// class CepListPage extends StatefulWidget {
//   const CepListPage({super.key});

//   @override
//   State<CepListPage> createState() => _CepListPageState();
// }

// class _CepListPageState extends State<CepListPage> {
//   List<CepBack4AppModel> cepList = [];

//   get dio => null;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     ApiService.fetchCEPs().then((ceps) {
//       setState(() {
//         cepList = ceps;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de CEPs'),
//       ),
//       body: ListView.builder(
//         itemCount: cepList.length,
//         itemBuilder: (context, index) {
//           final cepData = cepList[index];
//           return ListTile(
//             title: Text(cepData.cep),
//             subtitle: Text(cepData.logradouro),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                     // Implemente a lógica para atualizar o CEP (abrir um formulário de edição, por exemplo).
//                     // atualizarCeps(cepData);
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     // Implemente a lógica para excluir o CEP.
//                     // deleteCep(cepData);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
