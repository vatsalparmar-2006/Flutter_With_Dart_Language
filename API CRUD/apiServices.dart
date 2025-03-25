import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "API here...";

  Future<List<Map<String, dynamic>>> getUsers() async {
    var res = await http.get(Uri.parse(baseUrl));
    return List<Map<String, dynamic>>.from(json.decode(res.body));
  }

  Future<void> createUser(String name, String email) async {
    await http.post(Uri.parse(baseUrl),
        body: jsonEncode({'name': name, 'email': email}),
        headers: {'Content-Type': 'application/json'});
  }

  Future<void> updateUser(String id, String name, String email) async {
    await http.put(Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email}));
  }

  Future<void> deleteUser(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
