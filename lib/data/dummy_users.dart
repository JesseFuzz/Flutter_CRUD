//usando um MAP chamado dummyUsers que serão os meus usuários padrões do app
//criarei esses usuários usando o construtor da classe user
//serão os meus dados mockados

import 'package:flutter_crud/models/user.dart';

class UsersMock {
  //criei essa classe, antes era somente um map
  const UsersMock();
  static const dummyUsers = {
    //final eu preciso instanciar e static const eu não precisaria
    '1': User(
        id: '1',
        name: 'Jesse',
        email: 'jessesouzaall@gmail.com',
        avatarUrl:
            'https://cdn.pixabay.com/photo/2016/04/01/11/25/avatar-1300331_960_720.png'),
    '2': User(
        id: '2',
        name: 'Andressa',
        email: 'andressacalixto@gmail.com',
        avatarUrl:
            'https://cdn.pixabay.com/photo/2016/01/04/21/57/woman-1121654_960_720.png'),
    // '3': User(
    //     id: '3',
    //     name: 'Luiza',
    //     email: 'Luizavanessa@gmail.com',
    //     avatarUrl:
    //         'https://cdn.pixabay.com/photo/2016/04/01/11/25/avatar-1300331_960_720.png'),
    // '4': User(
    //     id: '4', name: 'Erico', email: 'ericodin@gmail.com', avatarUrl: ''),
  };
}
