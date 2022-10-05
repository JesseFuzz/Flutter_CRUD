import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final _form =
      GlobalKey<FormState>(); // _ underline pois essa variável é privada
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Formulário de Usuário'), //usando const para instanciar uma classe
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();
              if (isValid) {
                _form.currentState
                    ?.save(); //esse método chama em cada um dos meus fields o método save
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
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
                decoration: const InputDecoration(labelText: 'Nome'),
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
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Url do Avatar'),
                onSaved: (value) => _formData['AvatarUrl'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
