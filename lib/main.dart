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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //esse  método
    return ChangeNotifierProvider(
        // ignore: unnecessary_new
        create: (context) => new Users(),
        child: MaterialApp(
            //toda a aplicação é CHILD de ChangeNotifier e toda ela tem acesso ao ChangeNotifierProvider que no caso é a classe Users
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            routes: {
              AppRoutes.HOME: ((context) => const UserList()),
              AppRoutes.USER_FORM: (_) => const UserForm()
            }));
  }
}
