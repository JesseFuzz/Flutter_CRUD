//usando um MAP chamado dummyUsers que serão os meus usuários padrões do app
//criarei esses usuários usando o construtor da classe user
//serão os meus dados mockados

import 'package:flutter_crud/models/user.dart';

const dummyUsers = {
  '1': User(
      id: '1',
      name: 'Jesse',
      email: 'jessesouzaall@gmail.com',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2020/08/08/11/16/avatar-5472744_960_720.jpg'),
  '2': User(
      id: '2',
      name: 'Andressa',
      email: 'andressacalixto@gmail.com',
      avatarUrl:
          'https://cdn.pixabay.com/photo/2020/08/08/11/16/avatar-5472744_960_720.jpg')
};
