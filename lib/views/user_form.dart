import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm(
      //this.baseUser,
      {super.key});

  final _form =
      GlobalKey<FormState>(); // _ underline pois essa variável é privada
  final Map<String, Object> _formData = //String ou Object
      {}; //aqui estão os dados do meu formulário dentro desse MAP. estou adicionando as chaves e valores _formData['chave'] = valores

  //User? baseUser;
  void _loadFormData(User user) {
    //método privado para carregar  os dados do usuário do formulário
    // final isUserOk = user != null;
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
    //eu pego o user que tá na variável user ModalRoute abaixo
  }

  @override
  Widget build(BuildContext context) {
    //?pode ser nullo, pode retornar valor ou null; !não pode ser nullo, se for null quebra
    final arguments = ModalRoute.of(context)!.settings.arguments;
    User? user;

    final isToBeCreated = arguments == null;
    if (!isToBeCreated) {
      user = arguments as User;
      _loadFormData(user);
    }
    //tem a função de me fornecer os usuários quando eu clico em editar o usuário que ja ta criado
    //final User user = ModalRoute.of(context).settings.arguments; //poderia ser feito dessa forma já passando o tipo User na variável user
    //_loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading:
        //     false, //coloquei para retirar o  botão voltar
        title: const Text(
            'Formulário de Usuário'), //usando const para instanciar uma classe
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final currentState = _form.currentState;
              final isValid = currentState != null && currentState.validate();
              if (isValid) {
                _form.currentState
                    ?.save(); //esse método chama em cada um dos meus fields o método save

                if (isToBeCreated) {
                  //parentesis depois de User é prq estou instanciando a classe user
                  //sem parentesis é prq o createUser já é static
                  final newUser = Users.createUser({
                    'name': _formData['name'].toString(),
                    'email': _formData['email'].toString(),
                    'avatarUrl': _formData['avatarUrl'].toString(),
                  });
                  Provider.of<Users>(context, listen: false)
                      .persistUser(newUser.id, newUser);
                } else {
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      //estava dando erro pois não era string aí usei o toString
                      id: _formData['id'].toString(),
                      name: _formData['name'].toString(),
                      email: _formData['email'].toString(),
                      avatarUrl: _formData['avatarUrl'].toString(),
                    ),
                  );
                }
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key:
              _form, //aqui estou associando o meu formulário com a chave global lá em cima para que eu possa pegar os dados do formulário
          child: Column(
            children: <Widget>[
              TextFormField(
                //AQUI EU RECEBO O NOME E TRATO ELE
                initialValue:
                    _formData['name']?.toString() //se for nulo inicia vazio
                , //valor inicial que vai receber quando eu apertar pra editar
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.account_box),
                ),
                validator: (value) {
                  if (value == null || value == '' || value.trim().isEmpty) {
                    return 'Nome inválido!';
                    //validator é do validate la em cima
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito curto! No mínimo 3 letras.';
                  }
                  return null; //se eu chegar até aqui significa que o campo está validado corretamente.
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                //AQUI EU RECEBO O E-MAIL E TRATO ELE
                initialValue: _formData['email']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.email),
                ),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                //AQUI EU RECEBO A URL DO AVATAR E TRATO ELA
                initialValue: _formData['avatarUrl']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Url do Avatar',
                  icon: Icon(Icons.add_a_photo),
                ),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2080/2080904.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
