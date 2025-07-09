Cómo funciona la app
El usuario ingresa dos números y selecciona una operación (suma, resta, multiplicación o división). 
Cuando se pulsa un botón, la app envía los números y la operación solicitada al código nativo de iOS mediante un MethodChannel.

El código nativo realiza la operación matemática y devuelve el resultado a Flutter, que lo muestra en pantalla.


¿Por qué MethodChannel?
Flutter se ejecuta en Dart y no tiene acceso directo a todas las APIs o funciones específicas del sistema operativo. El MethodChannel 
permite comunicar Flutter con el código nativo (Swift) para ejecutar operaciones o acceder a funcionalidades del sistema que Flutter 
no puede manejar solo.

CUESTIONARIO
Si quisieras desarrollar un plugin para acceder a sensores del teléfono ¿Qué tecnología de la sección anterior emplearías? Justificar la respuesta
