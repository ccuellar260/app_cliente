import 'package:app_cliente_si2/views/procesos_crediticios/detalle_proceso_crediticio.dart';
import 'package:app_cliente_si2/views/vistas_login/dashboard.dart';
import 'package:app_cliente_si2/views/vistas_login/home.dart';
import 'package:app_cliente_si2/views/vistas_login/login_vista.dart';
import 'package:flutter/material.dart';

//rutas de la aplicacion
Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => const LoginVista(),
    'dashboard': (BuildContext context) => const VistaDashboard(),
    'home': (BuildContext context) => const HomePage(),
    'detalle':(context) => const DetalleProcesoCrediticioScreen(),

  };
}
