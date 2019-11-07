class Usuario {
  final int id;
  final String nome;
  final String genero;
  final String dataNascimento;
  final String fotoPerfil;
  final String token;

  Usuario(this.id, this.nome, this.genero, this.dataNascimento, this.fotoPerfil, this.token);

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        genero = json['genero'],
        dataNascimento = json['data_nascimento'],
        fotoPerfil = json['foto_perfil'],
        token = json['token'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'nome': nome,
      'genero': genero,
      'data_nascimento': dataNascimento,
      'foto_perfil': fotoPerfil,
      'token': token,
    };

}
