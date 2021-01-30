import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SignosMostrar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<SignosMostrar> {
  @override
  Widget build(BuildContext context)
  {
   // Map signos = ModalRoute.of(context).settings.arguments;
   // print(signos);

  return
      MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Seguimiento"),),
        body:
        Column(
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 15,
                sortColumnIndex: 2,
                sortAscending: false,
                columns: [
                  DataColumn(label: Text("Tiempo")),
                  DataColumn(label: Text("Temp"), numeric: true),
                  DataColumn(label: Text("Oxí"), numeric: true),
                  DataColumn(label: Text("Dia"), numeric: true),
                  DataColumn(label: Text("Sys"), numeric: true),
                  DataColumn(label: Text("Glu"), numeric: true),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("time")),
                    DataCell(Text("temp")),
                    DataCell(Text("oxi")),
                    DataCell(Text("dia")),
                    DataCell(Text("sis")),
                    DataCell(Text("glu"),),
                  ]),
                ],
              ),
            ),

          ],
        ),

        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.backspace),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      )
  );
  }
}




















/*
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SignosMostrar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<SignosMostrar> {

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
  Widget build(BuildContext context)
  {
    Map signos = ModalRoute.of(context).settings.arguments;
    print(signos);

    return
      MaterialApp(
          home: Scaffold(appBar: AppBar(title: Text("Seguimiento"),),
            body:
            Column(
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 15,
                    sortColumnIndex: 2,
                    sortAscending: false,
                    columns: [
                      DataColumn(label: Text("Tiempo")),
                      DataColumn(label: Text("Temp"), numeric: true),
                      DataColumn(label: Text("Oxí"), numeric: true),
                      DataColumn(label: Text("Dia"), numeric: true),
                      DataColumn(label: Text("Sys"), numeric: true),
                      DataColumn(label: Text("Glu"), numeric: true),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(signos['timeStamp'])),
                        DataCell(Text(signos['temperatura'])),
                        DataCell(Text(signos['oxigenacion'])),
                        DataCell(Text(signos['diastolica'])),
                        DataCell(Text(signos['sistolica'])),
                        DataCell(Text(signos['glucosa']),),
                      ]),
                    ],
                  ),
                ),

              ],
            ),

            floatingActionButton:
            FloatingActionButton(child: Icon(Icons.backspace),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          )
      );
  }
}*/
