Cómo funciona la app
El usuario ingresa dos números y selecciona una operación (suma, resta, multiplicación o división). 
Cuando se pulsa un botón, la app envía los números y la operación solicitada al código nativo de iOS mediante un MethodChannel.

El código nativo realiza la operación matemática y devuelve el resultado a Flutter, que lo muestra en pantalla.


¿Por qué MethodChannel?
Flutter se ejecuta en Dart y no tiene acceso directo a todas las APIs o funciones específicas del sistema operativo. El MethodChannel 
permite comunicar Flutter con el código nativo (Swift) para ejecutar operaciones o acceder a funcionalidades del sistema que Flutter 
no puede manejar solo.

CUESTIONARIO
Si quisieras desarrollar un plugin para acceder a sensores del teléfono ¿Qué tecnología de la sección anterior emplearías? Justificar 
la respuesta
Usaría MethodChannel porque es la forma estándar y sencilla de comunicar Flutter con el código nativo para pedir datos puntuales, como 
los sensores del teléfono.
Con MethodChannel puedes llamar funciones nativas que acceden a los sensores (como acelerómetro, GPS, etc.) y devolver esa información a 
Flutter de forma directa y fácil de manejar.
Las otras tecnologías (EventChannel, BasicMessageChannel, Pigeon, FFI) tienen usos más específicos o complejos, pero para acceder a 
sensores y obtener datos puntuales, MethodChannel es la opción más adecuada y simple.