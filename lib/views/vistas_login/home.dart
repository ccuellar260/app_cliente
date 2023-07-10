// ignore_for_file: dead_code, unused_import

import 'package:app_cliente_si2/controllers/auth_controller.dart';
import 'package:app_cliente_si2/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:app_cliente_si2/pie_chart.dart';

// import 'package:segundo_parcial_si2/services/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> procesos = [
    // {  "id": 1,
    //     "monto": 1000,
    //     "plazo": 7,
    //     "estado": "en_revicion",
    //     "fecha_solicitud": "2023-07-09",
    //     "fecha_aprobacion": null,
    //     "observacion": "sdf",
    //     "id_empleado": 1,
    //     "id_cliente": 1,
    //     "id_tipo_credito": 1,
    //     "created_at": "2023-07-09T20:02:39.000000Z",
    //     "updated_at": "2023-07-09T20:02:39.000000Z"
    // },
  ];

  @override
  void initState() {
    super.initState();
    obtenerDatos();
  }

  Future<void> obtenerDatos() async {
    AuthController a1 = AuthController();
    // print('=>> '+ authController.id_tenant);

    List<Map<String, dynamic>> xd = await a1.getProcesos();
    setState(() {
      procesos = xd; // Almacena los datos en la variable local
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Procesos Crediticios'),
        /* actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: (true)
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green[600],
                    size: 35.0,
                  )
                : Icon(Icons.offline_bolt, color: Colors.red[300], size: 35.0),
          )
        ], */
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: <Widget>[
          // _showGraph(),
          //   "id": 1,
          // "monto": 1000,
          // "plazo": 7,
          // "estado": "en_revicion",
          // "fecha_solicitud": "2023-07-09",
          // "fecha_aprobacion": null,
          // "observacion": "sdf",
          // "id_empleado": 1,
          // "id_cliente": 1,
          // "id_tipo_credito": 1,

          Expanded(
            child: ListView.builder(
                itemCount: procesos.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(procesos[i]['credito'].toString()),
                    leading: CircleAvatar(
                      child: Text('hola'.substring(0, 1).toUpperCase()),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: (procesos[i]['estado'] == "En Revision")
                              ? Colors.yellow
                              : (procesos[i]['estado'] == "Aprobado")
                                  ? Colors.greenAccent
                                  : Colors.red),
                      child: Text(procesos[i]['estado'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'detalle',
                          arguments: procesos[i]);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  // Mostrar gráfica
}
