import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

abstract class PeminjamanBuku {
  void kembalikanBuku(int batasPengembalian);
  void perpanjangBuku();
  List<Map<String, dynamic>> dataBuku();
}

mixin User {
  String dataUser(String nama, int waktu);
}

mixin Data {
  Future<void> ambilData();
}

class AdminState {
  final String message;

  AdminState(this.message);
}

class Admin extends Cubit<AdminState> with User, Data implements PeminjamanBuku {
  String? namaBuku;
  int? tahunTerbit;
  String? pengarang;

  Admin({
    this.namaBuku,
    this.pengarang,
    this.tahunTerbit,
  }) : super(AdminState('Initial State'));

  @override
  List<Map<String, dynamic>> dataBuku() {
    return [
      {
        "nama_buku": namaBuku ?? "",
        "tahun_terbit": tahunTerbit ?? "",
        "pengarang": pengarang ?? "",
      }
    ];
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      namaBuku: map["nama_buku"],
      tahunTerbit: map["tahun_terbit"],
      pengarang: map["pengarang"],
    );
  }

  @override
  void kembalikanBuku(int batasPengembalian) {
    int batasHari = 3;
    double denda = 15000;
    if (batasPengembalian <= batasHari) {
      emit(AdminState('Buku dikembalikan tepat waktu!'));
    } else {
      double pengurangan = denda * (batasPengembalian - batasHari);
      emit(AdminState('Kamu dikenakan denda sejumlah $pengurangan'));
    }
  }

  @override
  void perpanjangBuku() {
    emit(AdminState('Buku berhasil diperpanjang!'));
  }

  @override
  String dataUser(String nama, int waktu) {
    return 'nama $nama, meminjam buku $namaBuku, selama $waktu hari';
  }

  @override
  Future<void> ambilData() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AdminState('Data berhasil diambil'));
  }
}

class BelajarBloc2 extends StatefulWidget {
  const BelajarBloc2({Key? key}) : super(key: key);

  @override
  State<BelajarBloc2> createState() => _BelajarBloc2State();
}

class _BelajarBloc2State extends State<BelajarBloc2> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Admin>(
          create: (_) => Admin(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Library App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<Admin, AdminState>(
                builder: (context, state) {
                  return Text(state.message);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final admin = context.read<Admin>();
                  admin.kembalikanBuku(4);
                },
                child: const Text('balikin buku'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final admin = context.read<Admin>();
                  admin.perpanjangBuku();
                },
                child: const Text('perpanjang buku'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final admin = context.read<Admin>();
                  await admin.ambilData();
                },
                child: const Text('dapatkan data user'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
