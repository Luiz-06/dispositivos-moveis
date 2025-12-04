import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; 
import '../models/user_model.dart';

class AuthController {
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://localhost:3000'; 
    } else {
      return 'http://10.0.2.2:3000';  
    }
  }

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    print("Tentando conectar em: $url");
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        print("Login Sucesso: ${jsonDecode(response.body)}");
        return true;
      } else {
        print("Erro Login: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Erro de conexão: $e");
      return false;
    }
  }

  Future<bool> register(UserModel user) async {
    final url = Uri.parse('$baseUrl/register');
    print("Tentando registrar em: $url");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      return response.statusCode == 201;
    } catch (e) {
      print("Erro ao registrar: $e");
      return false;
    }
  }
}