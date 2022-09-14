import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String result = '';
  String operation = '';
  final _buffer = [0.0, 0.0];

  void add(String number) {
    switch (number) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          result += number;
          result = result.replaceAll(',', '.');
          if (!result.contains('.')) {
            int numberInt = int.parse(result);
            result = numberInt.toString();
          }
          result = result.replaceAll('.', ',');
          verifybuffer();
        });
        break;
      case '+':
        verifybuffer();
        operation = "+";
        setState((() => result = ''));
        break;
      case '-':
        verifybuffer();
        operation = "-";
        setState((() => result = ''));
        break;
      case '/':
        verifybuffer();
        operation = "/";
        setState((() => result = ''));
        break;
      case '%':
        verifybuffer();
        operation = "%";
        setState((() => result = ''));
        break;
      case 'AC':
        setState(() {
          result = '0';
          _buffer[0] = 0.0;
          _buffer[1] = 0.0;
          operation = '';
        });
        break;
      case '=':
        if (operation == "") return;
        if (_buffer[0] == 0.0 || _buffer[1] == 0.0) {
          setState(() => result = '0');
        } else {
          calc(operation);
        }
    }
  }

  void verifybuffer() {
    if (_buffer[0] < 1.0) {
      _buffer[0] = double.parse(result);
    } else {
      _buffer[1] = double.parse(result);
    }
  }

  void calc(String op) {
    double sum = 0.0;
    if (op == "x") {
      sum = _buffer[0] * _buffer[1];
    } else if (op == "+") {
      sum = _buffer[0] + _buffer[1];
    } else if (op == "-") {
      sum = _buffer[0] - _buffer[1];
    } else if (op == "/") {
      sum = _buffer[0] / _buffer[1];
    } else if (op == "%") {
      sum = _buffer[0] % _buffer[1];
    }
    setState(() {
      result = sum.toString();
      _buffer[0] = double.parse(result);
    });
  }

  void delete() {
    setState(() => result =
        result.length > 1 ? result.substring(0, result.length - 1) : '0');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text('Calculadora'),
            ),
            body: Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Coluna 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          result,
                          style: const TextStyle(
                              fontSize: 35, color: Colors.white),
                        )
                      ],
                    ),
                    //Coluna 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => add('AC'),
                            child: const Text('AC',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange))),
                        GestureDetector(
                            onTap: () => delete(),
                            child: const Text('DEL',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange))),
                        GestureDetector(
                            onTap: () => add('%'),
                            child: const Text('%',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange))),
                        GestureDetector(
                          onTap: () => add('÷'),
                          child: const Text('÷',
                              style: TextStyle(
                                  fontSize: 50, color: Colors.deepOrange)),
                        )
                      ],
                    ),
                    //Coluna 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => add('7'),
                            child: const Text('7',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('8'),
                            child: const Text('8',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('9'),
                            child: const Text('9',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => operation = 'x',
                            child: const Text('x',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange)))
                      ],
                    ),
                    //Coluna 4
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => add('4'),
                            child: const Text('4',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('5'),
                            child: const Text('5',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('6'),
                            child: const Text('6',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('+'),
                            child: const Text('+',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange))),
                      ],
                    ),
                    //Coluna 5
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => add('1'),
                            child: const Text('1',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('2'),
                            child: const Text('2',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                          onTap: () => add('3'),
                          child: const Text('3',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.white)),
                        ),
                        GestureDetector(
                          onTap: () => add('-'),
                          child: const Text('-',
                              style: TextStyle(
                                  fontSize: 50, color: Colors.deepOrange)),
                        )
                      ],
                    ),
                    //Coluna 6
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => add('0'),
                            child: const Text('0',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add(','),
                            child: const Text(',',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white))),
                        GestureDetector(
                            onTap: () => add('='),
                            child: const Text('=',
                                style: TextStyle(
                                    fontSize: 50, color: Colors.deepOrange)))
                      ],
                    )
                  ],
                ))));
  }
}
