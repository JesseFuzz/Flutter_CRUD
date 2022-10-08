import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
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
                icon: const Icon(Icons
                    .add), //aqui eu tenho o icone do meu método de adicionar
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes
                      .USER_FORM); //aqui eu chamo a rota que eu criei pra p .add
                  //aqui eu tenho o evento onPressed do meu método de adicionar
                }),
          ],
        ),
        // body: ListView.builder(
        //     itemCount: users.length,
        //     itemBuilder: (context, index) =>
        //         Text(users.values.elementAt(index).name)));
        body: ListView.builder(
            itemCount: users.count, //era .length, mas eu criei o .count
            itemBuilder: (context, index) => UserTile(users.byIndex(index)
                //era .values, mas eu criei o .all. era o .all mas eu criei o byIndex
                ))); //esse ListView vai criar uma lista dos dummyUsers no body
  }
}
