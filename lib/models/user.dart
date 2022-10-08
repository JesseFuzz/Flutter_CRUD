//minha classe usuário
class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  //final String password;

  //esse é o construtor do meu usuário
  //é um construtor constante pois todos os atributos da classe são finais
  const User({
    required this.id, //coloquei required somente para parar de dar problema
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  User.jesse() //construtor nomeado
      //pode ser usado para substituir meus dummyUsers
      : avatarUrl = 'sfgsgf',
        id = '10',
        name = 'jesse',
        email = 'jessesoza@fkdfjka';
}
