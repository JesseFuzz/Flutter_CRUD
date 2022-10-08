import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class UserTile extends StatelessWidget {
  final User user; //recebendo o usuário

  //construtor do UserTile
  const UserTile(this.user,
      {super.key}); //constante pois todos os valores são final

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final userAvatarDoNotExists =
        user.avatarUrl == null || user.avatarUrl.isEmpty;
    final avatar = userAvatarDoNotExists
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        height: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.blue)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Excluir Usuário'),
                      content: const Text('Tem certeza?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          child: const Text('Sim'),
                          onPressed: () {
                            // Provider.of<Users>(context, listen: false)
                            //     .remove(user);
                            //comentei pois coloquei um se .then abaixo para caso o pop abaixo retorne true aí o método .remove é executado
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    ),
                  ).then(
                      (confirmed) => //só uso esse .then pois o showDialog das confirmações de deleção me retornam um Future
                          Provider.of<Users>(context, listen: false)
                              .remove(user));
                },
                icon: const Icon(Icons.delete),
                color: Colors.red)
          ],
        ),
      ),
    );
  }
}
