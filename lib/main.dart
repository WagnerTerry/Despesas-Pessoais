import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
        id: 't1', title: "novo tenis", value: 310.59, date: DateTime.now()),
    Transaction(
        id: 't2', title: "conta de luz", value: 201.59, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
            Card(
              elevation: 5,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                      TextField(
                        controller: valueController,
                        decoration: InputDecoration(labelText: 'Valor (R\$)'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              print(titleController.text);
                              print(valueController.text);
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple),
                            ),
                            child: const Text(
                              'Nova Transação',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
