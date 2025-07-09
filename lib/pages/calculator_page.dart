import 'package:flutter/material.dart';
import '../services/native_calculator.dart';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();

  double? _result;
  String? _error;

  Future<void> _calculate(String operation) async {
    setState(() {
      _error = null;
    });

    try {
      final double num1 = double.parse(_num1Controller.text);
      final double num2 = double.parse(_num2Controller.text);

      final result = await NativeCalculator.invokeOperation(operation, num1, num2);

      setState(() {
        _result = result;
      });
    } catch (e) {
      setState(() {
        _result = null;
        _error = e.toString();
      });
    }
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora nativa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: Text('÷'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_error != null)
              Text('Error: $_error', style: TextStyle(color: Colors.red)),
            if (_result != null && _error == null)
              Text('Resultado: $_result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
