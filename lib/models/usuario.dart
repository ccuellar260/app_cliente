

class Usuario{
  String nombre;
  int ci;
  int registro;
  // String fec_nacimiento;
  String carrera;
  String correo;
  String contrasena;
  // List<String> autos;

  //constructor
   Usuario({
            this.nombre ='sin nombre',
            this.registro = 0,
            this.correo ='sin nombre',
             this.contrasena ='vacio',
            this.carrera ='sin nombre',
            this.ci = 0,
            
            // this.profeciones = const [], 
   });

   //factory constructor
  // factory Usuario.fromMap( Map<String, dynamic> obj) 
  // => Usuario(
  //   nombre  : obj['nombre'],
  //   registro: obj['registro'],
  //   correo  : obj['correo'],
  //   contrasena: obj['contrasena'],
  //   carrera : obj['carrera'],
  //   ci      : obj['ci'],

  // );

  //tranaformar a un mapa
  Map<String, dynamic> fromMap( Usuario usuario)
  => {
    'nombre'  : usuario.nombre,
    'registro': usuario.registro,
    'correo'  : usuario.correo,
    'contrasena': usuario.contrasena,
    'carrera' : usuario.carrera,
    'ci'      : usuario.ci,
  };



 
}