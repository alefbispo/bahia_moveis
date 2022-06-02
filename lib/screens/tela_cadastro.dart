import 'package:flutter/material.dart';

import '../components/montagem.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({Key? key}) : super(key: key);

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  final produtos = [];
  final nomeController = TextEditingController();
  final enderecoController = TextEditingController();
  final referenciaController = TextEditingController();
  final produtosController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration:
                        const InputDecoration(hintText: 'Nome do Cliente'),
                  ),
                  TextField(
                    controller: enderecoController,
                    decoration: const InputDecoration(hintText: 'Endereço'),
                  ),
                  TextField(
                    controller: referenciaController,
                    decoration: const InputDecoration(hintText: 'Referência'),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: produtosController,
                              decoration:
                                  const InputDecoration(hintText: 'Produtos'),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                produtos.add(produtosController.text);
                                produtosController.clear();
                              });
                            },
                            icon: const Icon(Icons.add),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 300,
                            child: ListView.builder(
                                itemCount: produtos.length,
                                itemBuilder: (context, index) {
                                  final item = produtos[index];
                                  return Row(
                                    children: [
                                      Expanded(child: Text(item)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              produtos.remove(item.toString());
                                            });
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  );
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final montagem = Montagem(
                          nomeCliente: nomeController.text,
                          endereco: enderecoController.text,
                          referencia: referenciaController.text,
                          produtos: produtos,
                        );
                        nomeController.clear();
                        referenciaController.clear();
                        enderecoController.clear();
                        setState(() {
                          produtos.clear();
                        });
                      },
                      child: const Text('Salvar'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
