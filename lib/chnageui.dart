import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chnage_langugae.dart';

class changeui extends StatefulWidget {
  const changeui({super.key});

  @override
  State<changeui> createState() => _changeuiState();
}

class _changeuiState extends State<changeui> {
  final namecontrol  = TextEditingController();
  final adresscontroll  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(width: 1)),child: TextFormField(controller: namecontrol,decoration: InputDecoration(label: Text('name')),)),
          Container(margin: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(width: 1)),child: TextFormField(controller: adresscontroll,decoration: InputDecoration(label: Text('addres')),),),
          Container(child: ElevatedButton(onPressed: () {
                  setState(() {

                  });
                  String name = namecontrol.text.toString();
                  String address = adresscontroll.text.toString();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => changelangugae(name: name, address: address)));
          }, child: Text("Submit")),),
        ],
      ),
    );
  }
}
