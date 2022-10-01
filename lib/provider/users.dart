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
}
