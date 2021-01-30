import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SignosCapturar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<SignosCapturar> {
  TextEditingController temperaturaControlador = TextEditingController();
  TextEditingController oxigenacionControlador = TextEditingController();
  TextEditingController diastolicaControlador = TextEditingController();
  TextEditingController sistolicaControlador = TextEditingController();
  TextEditingController glucosaControlador = TextEditingController();

  var timeStamp = DateTime.now().toString();
  double temperatura;
  int oxigenacion, diastolica, sistolica, glucosa;

  Database miBaseDatos;

  @override
  void initState() {
    super.initState();

    crearBaseDatos().then((valor) {
      miBaseDatos = valor;
    });
  }

  Future<Database> crearBaseDatos() async {
    WidgetsFlutterBinding.ensureInitialized();
    var ruta = await getDatabasesPath();
    String rutaCompletaBD = join(ruta, 'SEGUIMIENTO.DB');

    Database baseDatos = await openDatabase(rutaCompletaBD, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Seguimiento ('
          'nombre TEXT, '
          'cel INTEGER, '
          'timeStamp TEXT,'
          'temperatura NUM,'
          'oxigenacion INTEGER,'
          'diastolica INTEGER,'
          'sistolica INTEGER,'
          'glucosa INTEGER)');
    });
    return await baseDatos;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Seguimiento"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: temperaturaControlador,
                  decoration: InputDecoration(
                    hintText: "Temperatura",
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: oxigenacionControlador,
                  decoration: InputDecoration(
                    hintText: "Oxigenación",
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: diastolicaControlador,
                  decoration: InputDecoration(
                    hintText: "Presión Diastólica",
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: sistolicaControlador,
                  decoration: InputDecoration(
                    hintText: "Presión Sistólica",
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: glucosaControlador,
                  decoration: InputDecoration(
                    hintText: "Glucosa",
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Insertar",
                ),
                onPressed: () {
                  temperatura = double.parse(temperaturaControlador.text.toString());
                  oxigenacion = int.parse(oxigenacionControlador.text);
                  diastolica = int.parse(diastolicaControlador.text);
                  sistolica = int.parse(sistolicaControlador.text);
                  glucosa = int.parse(glucosaControlador.text);

                  miBaseDatos
                      .rawInsert(
                          'INSERT INTO Seguimiento (nombre, cel, timestamp, temperatura, oxigenacion, diastolica, sistolica, glucosa) '
                          'VALUES("Felipe", 5513894675, "$timeStamp", $temperatura, $oxigenacion, $diastolica, $sistolica, $glucosa)')
                      .then((value) {
                  });


/*                  Navigator.pushNamed(context, 'signosmostrar',
                      arguments: {
                        "timeStamp": timeStamp,
                        "temperatura": temperatura,
                        "oxigenacion": oxigenacion,
                        "diastolica": diastolica,
                        "sistolica": sistolica,
                        "glucosa": glucosa,
                      });
*/
                Navigator.pushNamed(context, 'signosmostrar');



                },
              ),
              RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Text("Borrar"),
                  onPressed: () {
                    miBaseDatos.rawDelete('DELETE FROM Seguimiento')
                        .then((value){
                      print("Borrados: $value");
                    });

                  }),
              RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Text("Consultar"),
                  onPressed: () {
                    miBaseDatos
                        .rawQuery('SELECT * FROM Seguimiento')
                        .then((value) {
                        print("Datos: $value");
                    });
                  }),
            ],
          )));
}
