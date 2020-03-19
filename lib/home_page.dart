import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lista_loader/components/skeleton.dart';
import 'package:lista_loader/model/endereco_model.dart';
import 'package:lista_loader/repositories/endereco_repository.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var streamConsultaEndereco = StreamController<List<EnderecoModel>>();
  EnderecoRepository enderecoRepository;

  @override
  void initState() {
    super.initState();
    enderecoRepository = EnderecoRepository();
  }

  buscarEnderecos() {
    streamConsultaEndereco.sink.add(null);
    enderecoRepository.buscarEndereco().then((data) {
      streamConsultaEndereco.sink.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton Lista'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: buscarEnderecos,
          )
        ],
      ),
      body: StreamBuilder(
        initialData: List<EnderecoModel>(),
        stream: streamConsultaEndereco.stream,
        builder: (BuildContext context,
            AsyncSnapshot<List<EnderecoModel>> snapshot) {
          if (!snapshot.hasData) {
            return Skeleton();
          } else {
            var enderecos = snapshot.data;
            return Visibility(
              visible: enderecos.isNotEmpty,
              replacement: Center(child:Text('Não tem nada')),
              child: ListView.builder(
                itemCount: enderecos.length,
                itemBuilder: (_, index) {
                  var endereco = enderecos[index];
                  return ListTile(
                    leading: Icon(
                      Icons.location_city,
                      size: 50,
                    ),
                    title: Text(endereco.endereco),
                    subtitle: Text(endereco.bairro),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    streamConsultaEndereco.close();
    super.dispose();
  }
}
