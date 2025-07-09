import 'package:flutter/services.dart';

class NativeCalculator {
  static const MethodChannel _channel = MethodChannel('com.example/calculator');

  static Future<double> invokeOperation(String operation, double num1, double num2) async {
    try {
      final result = await _channel.invokeMethod(operation, {
        'num1': num1,
        'num2': num2,
      });

      if (result is double) {
        return result;
      } else if (result is int) {
        // En caso que nativo retorne int, convertir a double
        return result.toDouble();
      } else {
        throw Exception('Tipo de resultado inesperado: ${result.runtimeType}');
      }
    } on PlatformException catch (e) {
      throw Exception('Error nativo: ${e.message}');
    }
  }
}
