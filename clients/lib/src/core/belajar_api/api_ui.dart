import 'package:clients/src/core/belajar_api/api_bloc.dart';
import 'package:clients/src/core/belajar_api/bloc.dart';
import 'package:clients/src/repository/user_repository.dart';
import 'package:clients/src/utils/model/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyUi extends StatefulWidget {
  const MyUi({Key? key}) : super(key: key);

  @override
  State<MyUi> createState() => _MyUiState();
}

class _MyUiState extends State<MyUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) =>
            UserRepository(), 
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiBloc>(
      create: (context) {
        UserRepository userRepository =
            RepositoryProvider.of<UserRepository>(context);
        // assert(userRepository != null, "UserRepository is null");
        return ApiBloc(userRepository)..add(LoadUserEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<ApiBloc, ApiState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedState) {
              List<UserModel> userList = state.usermodel;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black,
                    margin: const EdgeInsets.symmetric(horizontal: 10)
                        .add(const EdgeInsets.only(bottom: 10)),
                    child: ListTile(
                      title: Text(
                        userList[index].firstName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        userList[index].lastName,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is ErrorState) {
              return Center(
                child: Text('Eror : ${state.err}' , style: TextStyle(
                  color: Colors.black
                ),),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
