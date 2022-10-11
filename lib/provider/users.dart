import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../data/dummy_users.dart';
import '../models/user.dart';

//estudar o padrão observer (ChangeNotifier é um método observer)
//sempre que tivermos uma mudaça nesse método de usuários nós notificaremos os listeners da interface gráfica
class Users with ChangeNotifier {
  final Map<String, User>
      _items = //variáveis final eu não preciso tipar, é dinâmico
      Map.from(UsersMock.dummyUsers); //from é um método de criatção de MAP
  // final Map<String, User> _items = {...UsersMock.dummyUsers};
  //final Map<String, User> _items = {...dummyUsers}; estava dessa forma antes

  //método getAll
  List<User> get all => _items.values.toList();
  //return[..._items.values]; eu estava retornando assim
  //estou retornando uma cópia desse map por segurança ao invés de expor a lista de users

  //método para retornar a quantidade de usuários. Melhor criar ele do que usar o método acima e clonar toda vez.
  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    //tirei também um parametro desnecessário dele
    //metodo que ja tem no java
    //ignore: unnecessary_null_comparison
    if (user == null) {
      return;
    } else {
      if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
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
    // final userExists = user != null && user.id != null;
    if (1 == 1) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
