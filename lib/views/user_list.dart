import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
        context); //estava criando uma instância do meu mock de usuários aqui com o operador spread (clone) só para teste
    //mas agora estou usando o PROVIDER

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de usuários'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                onPressed: () {}),
          ],
        ),
        // body: ListView.builder(
        //     itemCount: users.length,
        //     itemBuilder: (context, index) =>
        //         Text(users.values.elementAt(index).name)));
        body: ListView.builder(
            itemCount: users.count, //era .length, mas eu criei o .count
            itemBuilder: (context, index) => UserTile(users.all.elementAt(
                //era .values, mas eu criei o .all
                index)))); //esse ListView vai criar uma lista dos dummyUsers no body
  }
}
