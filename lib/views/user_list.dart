import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    const users = {
      ...dummyUsers
    }; //estou criando uma instância do meu mock de usuários aqui com o operador spread (clone)

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de usuários'),
        ),
        // body: ListView.builder(
        //     itemCount: users.length,
        //     itemBuilder: (context, index) =>
        //         Text(users.values.elementAt(index).name)));
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => UserTile(users.values.elementAt(
                index)))); //esse ListView vai criar uma lista dos dummyUsers no body
  }
}
