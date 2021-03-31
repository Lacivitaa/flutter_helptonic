class Login {
  String email;
  String senha;

  Login({this.email, this.senha});

  @override
  String toString() {
    return 'Login:' + email + '/' + senha;
  }
}
