class User {
  int id;
  String nome;
  String email;
  String senha;
  String tipoDaltonismo;

  User({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.tipoDaltonismo,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    tipoDaltonismo = json['tipoDaltonismo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['tipoDaltonismo'] = this.tipoDaltonismo;
    return data;
  }
}
