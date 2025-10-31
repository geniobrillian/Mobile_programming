import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<UserModel>> getAllUser() async {
    final List<UserModel> allUser = [];

    try {
      var response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> body =
            json.decode(response.body) as Map<String, dynamic>;
        List? data = body["data"] as List?;

        if (data != null) {
          data.forEach((element) {
            allUser.add(UserModel.fromJson(element as Map<String, dynamic>));
          });
          return allUser;
        } else {
          throw Exception("Kunci 'data' tidak ditemukan atau null.");
        }
      } else {
        throw Exception("Request Gagal: Status Code ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Terjadi kesalahan: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Future Builder")),
      body: FutureBuilder<List<UserModel>>(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("LOADING...."));
          }

          if (snapshot.hasError) {
            return Center(child: Text("ERROR: ${snapshot.error}"));
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text(user.email),
                );
              },
            );
          }

          return const Center(child: Text("TIDAK ADA DATA"));
        },
      ),
    );
  }
}
