class Login {
  String username;
  String password;

  Login({required this.username, required this.password});

  // Método para converter Login em Map para enviar na requisição
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}