import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;

  void increase() {
    contador++;
    setState(() {});
  }

  void decrease() {
    contador--;
    setState(() {});
  }

  void reset() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize25 = TextStyle(fontSize: 25);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Contador')),
        elevation: 5.5,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Cantidad de clicks que se han hecho:',
                  style: fontSize25),
              Text('$contador', style: fontSize25)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonsCustomizados(
        decreaseFn: decrease,
        increaseFn: increase,
        resetFn: reset,
      ),
    );
  }
}

class FloatingActionButtonsCustomizados extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const FloatingActionButtonsCustomizados({
    Key? key,
    required this.resetFn,
    required this.decreaseFn,
    required this.increaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FloatingActionButton(
            onPressed: () => decreaseFn(),
            child: const Icon(Icons.exposure_minus_1)),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.restart_alt),
        ),
        FloatingActionButton(
            onPressed: () => increaseFn(),
            child: const Icon(Icons.exposure_plus_1)),
      ],
    );
  }
}
