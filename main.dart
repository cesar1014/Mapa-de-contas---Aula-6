import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Soma:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _y = 0;
  TextEditingController _controlaSoma = TextEditingController();
  Icon certo = Icon(Icons.check);
  Icon errado = Icon(Icons.close);
  Icon saida = Icon(Icons.question_mark);
  Map<String, Icon?> _respostas = {};

  @override
  void initState() {
    super.initState();
    _y = Random().nextInt(10);
  }

  @override
  void dispose() {
    _controlaSoma.dispose();
    super.dispose();
  }

  void corrigir() {
    int soma = 1 + _y;
    String digitado = _controlaSoma.text;
    int resultado = int.tryParse(digitado) ?? 0;

    setState(() {
      if (soma == resultado) {
        _respostas['1+$_y'] = certo;
      } else {
        _respostas['1+$_y'] = errado;
      }
      _y = Random().nextInt(10);
      _controlaSoma.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text('1 + $_y = '),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controlaSoma,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: corrigir,
              child: Text('Corrigir'),
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: saida,
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+0'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+1'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+2'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+3'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+4'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+5'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+6'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+7'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+8'],
                      ),
                    ),
                    TableCell(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: _respostas['1+9'],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
