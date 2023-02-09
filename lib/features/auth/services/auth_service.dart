import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipps/constants/global_variables.dart';
import 'package:sipps/constants/error_handling.dart';
import 'package:sipps/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';
import '../../home/screens/home_screen.dart';

class AuthService {
  // function for sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account has been successfuly created! Please Login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // function for sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
