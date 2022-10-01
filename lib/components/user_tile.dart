import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  final User user; //recebendo o usuário

  //construtor do UserTile
  const UserTile(this.user,
      {super.key}); //constante pois todos os valores são final

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
          width: 100,
          height: 100,
          child: Row(children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.blue)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red)
          ])),
    );
  }
}
