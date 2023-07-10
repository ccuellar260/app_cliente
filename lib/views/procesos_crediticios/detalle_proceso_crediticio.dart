import 'package:flutter/material.dart';

class DetalleProcesoCrediticioScreen extends StatefulWidget {
  const DetalleProcesoCrediticioScreen({super.key});

  @override
  State<DetalleProcesoCrediticioScreen> createState() =>
      _DetalleProcesoCrediticioScreenState();
}

class _DetalleProcesoCrediticioScreenState
    extends State<DetalleProcesoCrediticioScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> proceso =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Tipo de Credito'),
                  subtitle: Text(proceso['credito']),
                  tileColor: Colors.grey[200],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                    title: const Text('Estado', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(proceso['estado'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    tileColor: (proceso['estado'] == "En Revision")
                        ? Colors.yellow
                        : (proceso['estado'] == "Aprobado")
                            ? Colors.green
                            : Colors.red),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Monto'),
                  subtitle: Text("${proceso['monto']}Bs"),
                  tileColor: Colors.grey[200],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Plazo'),
                  subtitle: Text("${proceso['plazo']} Meses"),
                  tileColor: Colors.grey[200],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Fecha de Solicitud'),
                  subtitle: Text(proceso['fecha_solicitud']),
                  tileColor: Colors.grey[200],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
