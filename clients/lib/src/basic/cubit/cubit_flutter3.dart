class Data {
  String name;
  int password;

  Data({required this.name, required this.password});
}

abstract mixin class Auth {
  String login();
  String logout();
}

class Manage extends Data with Auth {
  Manage({required String user, required int password})
      : super(name: user, password: password);
  @override
  String login() {
    if (name.isNotEmpty && password > 0) {
      return 'user $name berhasil login!';
    } else {
      return 'login gagal';
    }
  }

  @override
  String logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

