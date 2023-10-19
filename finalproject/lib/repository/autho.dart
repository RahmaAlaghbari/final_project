import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../MainPages/Home.dart';
import 'authontication.dart';

class AuthenticationProviderr {

  final Dio _dio;

  AuthenticationProviderr(this._dio);

  Future<bool> login(String email, String password) async {
    try {
      // Make an API request to authenticate the user
      Response response = await _dio.get('https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/users');

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Access the response data
        final data = response.data;
        bool found = false;
        // Check if the response contains any data
        if (data != null && data is List && data.isNotEmpty) {
          // Iterate over the data list
          for (var element in data) {
            // Check if email and password match
            if (element["email"] == email && element["password"] == password) {
             // print( element["id"]);
              AuthenticationProvider.login(element["id"],element["fName"],
                  element["email"],
                  element["img"],
                  element["password"],
                  element["phone"],
                  element["per"],
                  element["gender"],
                  element["uName"]);
              found = true;

             print("found");
              return found;
               // Exit the loop if a match is found
            }
            else{
            return false;

            }
          }
        }
        return found;
      }

      // Return false if the response status code is not 200
      return false;
    } catch (error) {
      // Handle any errors that occur during the login process
      print('Login error: $error');
      return false;
    }
  }
}