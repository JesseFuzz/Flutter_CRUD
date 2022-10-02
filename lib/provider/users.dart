import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../data/dummy_users.dart';
import '../models/user.dart';

//estudar o padrão observer (ChangeNotifier é um método observer)
//sempre que tivermos uma mudaça nesse método de usuários nós notificaremos os listeners da interface gráfica
class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  //criarei os meus métodos aqui

  //método getAll
  List<User> get all {
    return [
      ..._items.values
    ]; //estou retornando uma cópia desse map por segurança ao invés de expor a lista de users
  }

  //método para retornar a quantidade de usuários. Melhor criar ele do que usar o método acima e clonar toda vez.
  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user, {required String avatarUrl}) {
    //metodo que ja tem no java
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    } else {
      if (user.id != null &&
          user.id.trim().isNotEmpty &&
          _items.containsKey(user.id)) {
        //min 41:20
        _items.update(
            user.id,
            (value) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl));
      }
      //adicionar um usuário
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl));
      notifyListeners();
    }
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
