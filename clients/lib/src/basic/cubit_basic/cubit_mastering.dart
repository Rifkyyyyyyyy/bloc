import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ObjectData {
  List<Map<String, dynamic>> dataIdent();
}

class DataOrang extends Cubit<List<Map<String, dynamic>>>
    implements ObjectData {
  String? namaOrang;
  String? jalan;
  int? umur;
  String? status;
  String? pekerjaan;

  DataOrang({
    this.namaOrang,
    this.umur,
    this.jalan,
    this.status,
    this.pekerjaan,
  }) : super([]);

  @override
  List<Map<String, dynamic>> dataIdent() {
    return [
      {
        "nama": namaOrang,
        "umur": umur,
        "status": status,
        "pekerjaan": pekerjaan,
        "alamat": jalan
      }
    ];
  }

  factory DataOrang.fromMap(Map<String, dynamic> map) {
    return DataOrang(
      namaOrang: map["nama"],
      umur: map["umur"],
      status: map["status"],
      pekerjaan: map["pekerjaan"],
      jalan: map["alamat"],
    );
  }

  Future<void> addData(DataOrang newData) async {
    emit([...state, ...newData.dataIdent()]);
  }

  Future<void> deleteData(DataOrang dataToDelete) async {
    emit(
        state.where((data) => data != dataToDelete.dataIdent().first).toList());
  }
}

class BelajarCubit4 extends StatefulWidget {
  const BelajarCubit4({Key? key, required this.dataOrang}) : super(key: key);

  final DataOrang dataOrang;

  @override
  State<BelajarCubit4> createState() => _BelajarCubit4State();
}

class _BelajarCubit4State extends State<BelajarCubit4> {
  late TextEditingController namaController;
  late TextEditingController umurController;
  late TextEditingController statusControler;
  late TextEditingController pekerjaanControler;
  late TextEditingController alamatController;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController();
    umurController = TextEditingController();
    statusControler = TextEditingController();
    pekerjaanControler = TextEditingController();
    alamatController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<DataOrang, List<Map<String, dynamic>>>(
        bloc: widget.dataOrang,
        builder: (context, state) {
          return SafeArea(
            top: true,
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                        color: const Color.fromARGB(255, 2, 88, 159),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    margin:
                        const EdgeInsets.symmetric(vertical: 70, horizontal: 10)
                            .add(const EdgeInsets.only(bottom: 10)),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('data'),
                        SizedBox(
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                                child: TextFormField(
                                  controller: namaController,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      labelText: 'Nama',
                                      labelStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                height: 55,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: umurController,
                                  decoration: const InputDecoration(
                                      labelText: 'Umur',
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      labelStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                height: 55,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                                child: TextFormField(
                                  controller: statusControler,
                                  decoration: const InputDecoration(
                                      labelText: 'Status',
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      labelStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                height: 55,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                                child: TextFormField(
                                  controller: pekerjaanControler,
                                  decoration: const InputDecoration(
                                      labelText: 'Pekerjaan',
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      labelStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                height: 55,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black12, width: 0.5)),
                                child: TextFormField(
                                  controller: alamatController,
                                  decoration: const InputDecoration(
                                      labelText: 'Alamat',
                                      contentPadding: EdgeInsets.all(10),
                                      border: InputBorder.none,
                                      labelStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 60,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(8)),
                                child: GestureDetector(
                                  onTap: () async {
                                    DataOrang newData = DataOrang(
                                      namaOrang: namaController.text,
                                      umur: int.tryParse(umurController.text),
                                      status: statusControler.text,
                                      pekerjaan: pekerjaanControler.text,
                                      jalan: alamatController.text,
                                    );
                                    widget.dataOrang.addData(newData);
                                  },
                                  child: Text('Add Data'),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.map((data) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10)
                            .add(const EdgeInsets.only(bottom: 10)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: ListTile(
                          title: Text(data['nama'] ?? ''),
                          subtitle: Text('Umur: ${data['umur']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              widget.dataOrang
                                  .deleteData(DataOrang.fromMap(data));
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
