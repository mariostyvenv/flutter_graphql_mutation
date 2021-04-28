import 'package:flutter/material.dart';

class FormWithOutPage extends StatefulWidget {
  @override
  _FormWithOutPageState createState() => _FormWithOutPageState();
}

class _FormWithOutPageState extends State<FormWithOutPage> {

  TextEditingController nameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  String name = '', lastname = '';

  @override
  void initState() {
    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                  controller: nameTextController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Apellido'),
                  controller: lastNameTextController,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: double.infinity),
                  child: ElevatedButton(
                    child: Text('Enviar'),
                    onPressed: () {
                      setState(() {
                        name = nameTextController.text;
                        lastname = lastNameTextController.text;
                      });
                    },
                  ),
                ),
                Container(
                  child: Center(
                    child: Text('$name $lastname'),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    nameTextController.dispose();
    lastNameTextController.dispose();
    super.dispose();
  }
}
