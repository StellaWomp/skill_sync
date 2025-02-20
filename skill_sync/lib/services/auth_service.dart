import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/login.dart';

class AuthService {
  final String apiUrl = 'http://100.109.1.129:8004/api/login/'; // Altere para o URL da sua API

  Future<bool> login(Login login) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(login.toJson()),
    );

    if (response.statusCode == 200) {
      print('Login bem-sucedido!');
      return true;
    } else {
      print('Falha no login: ${response.body}');
      return false;
    }
  }
}