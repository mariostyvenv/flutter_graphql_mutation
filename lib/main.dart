import 'package:example_1/src/pages/form_with_page.dart';
import 'package:example_1/src/pages/form_without_page.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final HttpLink httpLink = new HttpLink('https://harxz.com/graphql');
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client =
        new ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: GraphQLCache()),
    );

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: FormWithPage()));
  }
}
