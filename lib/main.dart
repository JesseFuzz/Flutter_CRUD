import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //esse  método
    return ChangeNotifierProvider(
      // ignore: unnecessary_new
      create: (context) => new Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //para tirar o debug da appbar
        //toda a aplicação é CHILD de ChangeNotifier e toda ela tem acesso ao ChangeNotifierProvider que no caso é a classe Users
        title: 'Flutter CRUD',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          AppRoutes.home: ((context) => const UserList()),
          AppRoutes.userForm: (_) => UserForm()
        },
      ),
    );
  }
}
