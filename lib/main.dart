import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reto 1',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Mintic - Uninorte - Reto No 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "COP";
String op2 = "USD";

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<DropdownMenuItem<String>> dd = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("8", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("7", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("6", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("5", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("4", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("3", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("2", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("1", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("0", Color.fromARGB(255, 212, 218, 221), Icon(Icons.abc)),
  calculadora("reset", Color.fromARGB(255, 212, 218, 221), Text("Clear")),
  calculadora(
      "Calcular", Color.fromARGB(255, 212, 218, 221), Icon(Icons.view_stream)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(80),
        child: Column(
          children: [
            Row(
              children: [
                Text("De : "),
                DropdownButton(
                    value: op1,
                    items: dd,
                    onChanged: (String? X) {
                      setState(() {
                        op1 = X.toString();
                      });
                    }),
                VerticalDivider(),
                VerticalDivider(),
                VerticalDivider(),
                Text("A : "),
                DropdownButton(
                    value: op2,
                    items: dd,
                    onChanged: (String? X) {
                      setState(() {
                        op2 = X.toString();
                      });
                    }),
              ],
            ),
            TextField(
              controller: textOrigen,
              decoration:
                  InputDecoration(labelText: "Moneda Origen", hintText: "0"),
            ),
            TextField(
                controller: textDestino,
                decoration: InputDecoration(
                    labelText: "Moneda Destino", hintText: "0")),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: cal.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: cal[index].color,
                  child: ListTile(
                    title: Center(
                      child: index > 9
                          ? cal[index].icono
                          : Text(cal[index].titulo),
                    ),
                    onTap: () {
                      if (index < 10) {
                        textOrigen.text = textOrigen.text + cal[index].titulo;
                      } else if (index == 10) {
                        textOrigen.text = "";
                        textDestino.text = "";
                      } else {
                        if (op1 == "USD" && op2 == "COP") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 5000).toString();
                        } else if (op1 == "COP" && op2 == "USD") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 5000).toString();
                        } else if (op1 == "EUR" && op2 == "COP") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 5100).toString();
                        } else if (op1 == "COP" && op2 == "EUR") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 5100).toString();
                        } else if (op1 == "EUR" && op2 == "USD") {
                          textDestino.text =
                              (double.parse(textOrigen.text) * 1.1).toString();
                        } else if (op1 == "USD" && op2 == "EUR") {
                          textDestino.text =
                              (double.parse(textOrigen.text) / 1.1).toString();
                        } else {
                          textDestino.text = textOrigen.text;
                        }
                      }

                      print(cal[index].titulo);
                    },
                  ),
                );
              },
            ))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
