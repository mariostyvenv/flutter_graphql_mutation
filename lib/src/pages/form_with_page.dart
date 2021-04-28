import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FormWithPage extends StatefulWidget {
  @override
  _FormWithPageState createState() => _FormWithPageState();
}

class _FormWithPageState extends State<FormWithPage> {
  String email = '', cell = '', name = '', description = '';
  final formKey = GlobalKey<FormState>();
  final String harxzform = """
  mutation contact(\$input: ContactInput){
    contact(input:\$input){
      status
      message
    }
  }
  """;

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
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Llene el campo';
                      }
                    },
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Celular'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Llene el campo';
                      }
                    },
                    onSaved: (value) {
                      cell = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Llene el campo';
                      }
                    },
                    onSaved: (value) {
                      name = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Descripcion del proyecto'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Llene el campo';
                      }
                    },
                    onSaved: (value) {
                      description = value;
                    },
                  ),
                  Mutation(
                    options: MutationOptions(
                      document: gql(harxzform),
                      update: (GraphQLDataProxy cache, QueryResult result) {
                        return cache;
                      },
                      onCompleted: (dynamic resultData) {
                        print(resultData);
                      },
                    ),
                    builder: (
                      RunMutation runMutation,
                      QueryResult result,
                    ) {
                      return ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: double.infinity),
                        child: ElevatedButton(
                          child: Text('Enviar'),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              runMutation({
                                "input": {
                                  "email": email,
                                  "cell": cell,
                                  "name": name,
                                  "message": description
                                }
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
