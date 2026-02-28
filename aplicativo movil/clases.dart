import 'dart:convert';

class Usuario {
  String nombreCompleto;
  int edad;
  String carrera;
  String pais;

  // Constructor principal
  Usuario(this.nombreCompleto, this.edad, this.carrera, this.pais);

  // Constructor por nombre desde JSON
  Usuario.desdeCadenaJson(String jsonString) {
    final Map<String, dynamic> datos = jsonDecode(jsonString);
    nombreCompleto = datos['nombreCompleto'];
    edad = datos['edad'];
    carrera = datos['carrera'];
    pais = datos['pais'];
  }

  // Método tradicional SIN parámetros
  void mostrarInformacion() {
    print(
        'Mi nombre es $nombreCompleto, tengo $edad años, estudio/trabajo en $carrera y vivo en $pais.');
  }

  // Método tradicional CON parámetros
  void enviarSaludo(String destinatario) {
    print('$nombreCompleto le envía un saludo a $destinatario.');
  }

  // Método flecha SIN parámetros
  void actividadActual() =>
      print('$nombreCompleto está practicando programación en Dart.');

  // Método flecha CON parámetros
  void despedida(String persona) =>
      print('$nombreCompleto se despide de $persona. ¡Hasta luego!');
}

void main() {
  print('===== ACTIVIDAD EN DART =====\n');

  // Probando constructor principal
  Usuario user1 =
      Usuario('Andrés Martínez', 21, 'Ingeniería de Software', 'Colombia');

  print('--- Probando constructor principal ---');
  user1.mostrarInformacion();

  print('\n--- Probando métodos tradicionales ---');
  user1.enviarSaludo('Carlos');
  user1.mostrarInformacion();

  print('\n--- Probando métodos flecha ---');
  user1.actividadActual();
  user1.despedida('Laura');

  print('\n--- Probando constructor JSON ---');
  String datosJson =
      '{"nombreCompleto":"Valentina Rojas","edad":24,"carrera":"Arquitectura","pais":"México"}';

  Usuario user2 = Usuario.desdeCadenaJson(datosJson);
  user2.mostrarInformacion();
  user2.enviarSaludo('Miguel');
  user2.actividadActual();
  user2.despedida('Miguel');
}