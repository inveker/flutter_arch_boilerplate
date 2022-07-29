import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_arch_boilerplate/api/api_config.dart';
import 'package:flutter_arch_boilerplate/api/api_exception.dart';
import 'package:flutter_arch_boilerplate/models/authentication/authentication_model.dart';

class AuthenticationApi {
  static Future<AuthenticationModel> login({required String login, required String password,}) async {
    final response = await http.post(
      ApiConfig.uri.replace(
        path: 'login',
      ),
      body: {
        'json': jsonEncode(
          {
            'login': login,
            'password': password,
          },
        ),
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode < 400) {
      return AuthenticationModel.fromJson(data);
    } else {
      throw ApiException(message: data["message"] ?? 'Login error ${response.statusCode}');
    }
  }

  static Future<AuthenticationModel> register({required String login, required String password,}) async {
    final response = await http.post(
      ApiConfig.uri.replace(
        path: 'register',
      ),
      body: {
        'json': jsonEncode(
          {
            'login': login,
            'password': password,
          },
        ),
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode < 400) {
      return AuthenticationModel.fromJson(data);
    } else {
      throw ApiException(message: data["message"] ?? 'Register error ${response.statusCode}');
    }
  }
}