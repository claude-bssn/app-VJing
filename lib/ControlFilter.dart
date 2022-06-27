import 'dart:async';
import 'dart:convert';
import 'dart:developer';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_VJing/filters/filter.dart';
import 'package:flutter_VJing/filters/filterRepo.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ControlFilter extends StatefulWidget {
  final BluetoothDevice server;

  const ControlFilter({this.server});

  @override
  _ControlFilter createState() => new _ControlFilter();
}

class _ControlFilter extends State<ControlFilter> {
  BluetoothConnection connection;
  // final filters = new FilterRepository();
  FilterRepository filters = new FilterRepository();

  // Fetch content from the json file

  // Future<void> readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/MOCK_DATA.json');
  //   final data = await json.decode(response);
  //   print("COUCOUUUUUUUU");
  //   print(data);
  //   setState(() {});
  //   return filters = data["items"];
  // }

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  @override
  void initState() {
    super.initState();
    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
      });
      //  connection.input.listen(_onDataReceived).onDone(() {
      //       // Example: Detect which side closed the connection
      //       // There should be `isDisconnecting` flag to show are we are (locally)
      //       // in middle of disconnecting process, should be set before calling
      //       // `dispose`, `finish` or `close`, which all causes to disconnect.
      //       // If we except the disconnection, `onDone` should be fired as result.
      //       // If we didn't except this (no flag set), it means closing by remote.
      //         // if (isDisconnecting) {
      //         //   print('Disconnecting locally!');
      //         // } else {
      //         //   print('Disconnected remotely!');
      //         // }
      //       if (this.mounted) {
      //         setState(() {});
      //       }
      //     });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtersData = filters.getAll(context);
    final resultat = [];
    filtersData.then((resultat) {
      inspect(resultat);

      return  Row(
      children: [
        
          Text(resultat[1].id.toString()),
          // Text(
        ],
      );
    });
    // print(filtersData);

    print("LAAAAAAAAAAAAA"); // TODO: implement build


    return Row(
      children: [
       
        // Text(filtersData[1].id),
        // Text(
      ],
    );
    // throw UnimplementedError();
  }
}
