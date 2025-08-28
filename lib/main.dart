import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_list/user_bloc/user_event.dart';
import 'package:project_list/user_bloc/user_bloc.dart';
import 'package:project_list/repositary/product_repositary.dart';
import 'package:project_list/screens/product_list_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final ProductRepository repo = ProductRepository();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Bloc Api List",
      home: BlocProvider(
        create: (context) => ProductBloc(repo)..add(LoadProducts()),
        child: ProductListScreen(),
      ),
    );
  }
}
