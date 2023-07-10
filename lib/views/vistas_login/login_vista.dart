// ignore_for_file: avoid_print, use_build_context_synchronously, unnecessary_this

import 'package:flutter/material.dart';
import 'package:app_cliente_si2/controllers/auth_controller.dart';

class LoginVista extends StatefulWidget {
  const LoginVista({super.key});

  @override
  State<LoginVista> createState() => _LoginVistaState();
}

class _LoginVistaState extends State<LoginVista> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usuario = '';
  String contra = '';
  int seleccionado = 0; //seleciona un id de la empresa
  // String mensaje = '';
  bool ban = false;
  final AuthController a1 = AuthController();

  List<Map<String, dynamic>> datos = [
    {'id': 'hola ', 'nombre': 'nombre'}
  ]; // Variable para almacenar los datos

  @override
  void initState() {
    super.initState();
    obtenerDatos(); // Llama al método para obtener los datos en el initState
  }

  Future<void> obtenerDatos() async {
    List<Map<String, dynamic>> xd = await a1.getEmpresas();
    setState(() {
      datos = xd; // Almacena los datos en la variable local
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //propiedad para mostrar algo en el fondo!
      children: <Widget>[
        _crearFondo(context),
        _loginFrom(context),
      ],
    ));
  }

  Widget _crearFondo(BuildContext contenido) {
    //me saca el tamanio que tiene la pantalla
    final tamanio = MediaQuery.of(contenido).size;

    final fondoArriba = Container(
      //contenedor
      height: tamanio.height, //cuanto de alto, mostrar solo el 40 %
      width: double.infinity, //ancho, todo el ancho de la pantalla
      decoration: const BoxDecoration(
          //para decorar
          gradient: LinearGradient(
        //degradar
        colors: <Color>[
          Color.fromARGB(255, 244, 65, 65),
          Color.fromARGB(255, 214, 111, 111),
          Color.fromARGB(255, 221, 174, 174),
        ],
      )),
    );

    return Stack(
      children: <Widget>[
        fondoArriba,
        //poner el logo y el nombre
        Container(
          padding: const EdgeInsets.only(top: 50.0), //padding de arriba
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.person_pin_rounded,
                  color: Colors.white, size: 100.0),
              Image.asset(
                'assets/images/logo-v2.png',
                height: 150.0,
              ),
              const SizedBox(
                height: 10.0,
              ), //separacion
            ],
          ),
        )
      ],
    );
  } //end crear fondo

  Widget _loginFrom(BuildContext co) {
    final tamanio = MediaQuery.of(co).size; //tamanio de la pantalla
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: tamanio.width,
            margin: EdgeInsets.only(
                top: tamanio.height * 0.35, left: 20.0, right: 20.0),
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ), //padding de 50
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const <BoxShadow>[
                  //para las sombras
                  BoxShadow(
                      color: Color.fromARGB(66, 70, 68, 68),
                      blurRadius: 5.0, //potencia de la sombra
                      offset: Offset(
                        0.0,
                        5.0,
                      ), //solo abajo las sombras
                      spreadRadius: 3.0 //dimension sde la sombra
                      )
                ]),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              ///validacion en tiempo real
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('INICIO DE SESION',
                      style: TextStyle(fontSize: 20.0)),
                  const SizedBox(
                    height: 10.0,
                  ), //separar, espacio
                  //creare la caja de email
                  _crearSelect(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _crearCajas('Correo'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _crearCajaContrasena(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _crearMensaje(co),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _botonLogin(co),
                  // SizedBox( height: 10.0,),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90.0,
          ),
          // const Text(
          //   'Olvido su contrasenia?',
          //   style: TextStyle(fontSize: 20.0),
          // ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor:
          //         MaterialStateProperty.all<Color>(Colors.blueGrey),
          //   ),
          //   child: Container(
          //     margin: const EdgeInsetsDirectional.only(start: 80.0, end: 80.0),
          //     child: const Text(
          //       'Crear Nueva Cuenta!',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          //   onPressed: () {
          //     print('hola que tal ');
          //     Navigator.pushNamed(co, 'registro');
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _crearSelect() {
// Widget del campo de selección
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: DropdownButtonFormField<String>(
        items: datos.map((option) {
          return DropdownMenuItem<String>(
            value: option['id'].toString(),
            child: Text(option['nombre'].toUpperCase()),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Seleccione una empresa',
          labelStyle: TextStyle(),
          icon: Icon(
            Icons.business_center_outlined,
            color: Colors.blueGrey,
            size: 35.0,
          ),
        ),
        onChanged: (value) {
          // print('=>> seleccionado $value');
          setState(() {
            this.seleccionado = int.parse(value!);
          });
          print('=>> seleccionado $seleccionado ');
        },
      ),
    );
  }

  Widget _crearMensaje(BuildContext co) {
    if (ban == true) {
      print('=> creamdo mensaje de error');
      List<Widget> lista = [];
      print(a1.validaciones);
      a1.validaciones!.forEach((key, value) {
        if (value != null) {
          lista.add(
            Text(
              value.toString(),
              style: const TextStyle(
                  //  background: Color(Colors.red),
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                  // backgroundColor: Colors.red,
                  ),
            ),
          );
          lista.add(const SizedBox(
            height: 10.0,
          ));
        }
      });

      return Column(
        children: lista,
      );
    } else {
      return Container();
    }
  }

  Widget _crearCajas(String tipo) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        initialValue: '', //para inicializar valores
        decoration: InputDecoration(
            icon: Icon(
              Icons.email_outlined,
              color: Colors.blueGrey[400],
              size: 35.0,
            ),
            //  hintText: 'ejemplo@gmail.com',
            labelText: tipo,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10)),
        validator: (value) {
          if (value.toString().isEmpty) {
            //si esta vacio
            return "Por favor ingrese su correo";
          }
          return null;
        },
        onSaved: (value) {
          // print(tipo);
          if (tipo != 'Contrasena') {
            this.usuario = value.toString();
          } else {
            this.contra = value.toString();
          }
        },
      ),
    );
  } //end crear cajas

  Widget _crearCajaContrasena() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        initialValue: '', //para inicializar valores
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock_outline,
              color: Colors.blueGrey[400],
              size: 35.0,
            ),
            //  hintText: 'ejemplo@gmail.com',
            labelText: 'Contrasena',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10)),
        validator: (value) {
          if (value.toString().isEmpty) {
            //si esta vacio
            return "Por favor ingrese su contraseña";
          }
          return null;
        },
        onSaved: (value) {
          // print(tipo);
          contra = value.toString();
        },
      ),
    );
  } //end crear cajas

  Widget _botonLogin(BuildContext cont_boton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          //estilos del boton
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 100.0),
        child: const Text(
          'Ingresar',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      onPressed: () {
        print('=>> le di =>>>>>>>>>>>>> click!!');
        if (!_formKey.currentState!.validate()) {
          // código para procesar el formulario
          print('=>> es nulo debe colocar datos');
          //poner un mensaje
        } else {
          _formKey.currentState?.save();
          //hacer login

          hola() async {
            print('=>> entre a hola');
            await a1.loginStore(usuario, contra, seleccionado);
            if (a1.estado == 'Login Existo') {
              print('=>> SII IR A DABOARD');
              Navigator.pushReplacementNamed(cont_boton, 'home');
            } else {
              print('=>> mostrar mensaje error');
              // print(a1.mensaje);
              setState(() {
                ban = true;
              });
            }
            print('=>> sali el hola');
          }

          hola();
        } //ens if else

        print('=>> todo bien !!');
        print(this.usuario);
        print(this.contra);
      },
    );
  }
}
