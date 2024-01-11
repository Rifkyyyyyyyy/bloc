import 'package:clients/src/core/belajar_api2/api2_bloc.dart';
import 'package:clients/src/core/belajar_api2/api2_state.dart';
import 'package:clients/src/core/belajar_api2/api2_ui.dart';
import 'package:clients/src/repository/product_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyAppUI extends StatelessWidget {
  const MyAppUI({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home:  RepositoryProvider(
          create: (context) => ProductRepository(),
          child: const Home(),
        )
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => ApiBloc2(
          productRepository:RepositoryProvider.of<ProductRepository>(context)
      ),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocListener<ApiBloc2, ProductState>(
              listener: (context, state) {
                if (state is ProductAdded) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Product added"), duration: Duration(seconds: 2),));
                }
              },
              child: BlocBuilder<ApiBloc2, ProductState>(
                builder: (context, state) {
                  if (state is ProductAdd) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state is ProductError){
                    return const Center(child:Text("Error"));
                  }
                  return const HomePage();
                },
              )
          )
      ),
    );
  }
}