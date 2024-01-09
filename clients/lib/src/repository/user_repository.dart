import 'dart:convert';
import 'package:clients/src/utils/model/users_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String endpoint = 'https://reqres.in/api/users';
  int currentPage = 1;

  Future<List<UserModel>> getUsers() async {
    List<UserModel> allUsers = [];

    try {
      while (true) {
        final response =
            await http.get(Uri.parse('$endpoint?page=$currentPage'));

        if (response.statusCode == 200) {
          final List<dynamic> result = jsonDecode(response.body)['data'];
          List<UserModel> users =
              result.map((e) => UserModel.fromJson(e)).toList();
          allUsers.addAll(users);

          int totalPages = jsonDecode(response.body)['total_pages'];
          if (currentPage < totalPages) {
            currentPage++;
          } else {
            break;
          }
        } else {
          print('fail s: ${response.statusCode}');
          break;
        }
      }

      return allUsers;
    } catch (e) {
      print('err: $e');
      return [];
    }
  }
}
