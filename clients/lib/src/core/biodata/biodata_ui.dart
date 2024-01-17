import 'package:clients/src/core/biodata/biodata_bloc.dart';
import 'package:clients/src/core/biodata/biodata_event.dart';
import 'package:clients/src/core/biodata/biodata_state.dart';
import 'package:clients/src/utils/model/user_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(create: (context) => null),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerAge = TextEditingController();

  void isiData(context) {
    int age = int.tryParse(textEditingControllerAge.text) ?? 0;
    BlocProvider.of<BiodataBloc>(context)
        .add(CreateData(nama: textEditingControllerName.text, umur: age));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textEditingControllerName,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: textEditingControllerAge,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              isiData(context);
            },
            child: Text('Submit'),
          ),
          BlocBuilder<BiodataBloc, BiodataState>(
            builder: (context, state) {
              if (state is DataBiodata && state.biodata.isNotEmpty) {
                Biodata biodata = state.biodata[0];
                return Column(
                  children: [
                    Text('Name: ${biodata.name}'),
                    Text('Age: ${biodata.age.toString()}'),
                  ],
                );
              }
              return Container(); // Return an empty container or another widget if needed
            },
          ),
        ],
      )),
    );
  }
}
