import 'dart:async';

class MockAuthService {

  static final List<Map<String, String>> _fakeDatabase = [
    {
      'name': 'teste1',
      'email': 'teste1',
      'password': '1' 
    }
  ];

  Future<Map<String, dynamic>> login(String email, String password) async {
    print("MockAuth: Tentando login para $email...");
    
    await Future.delayed(const Duration(seconds: 1));

    try {
      final user = _fakeDatabase.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
      );

      print("MockAuth: Login Sucesso!");
      return {
        'success': true,
        'token': 'token_falso_123456', 
        'user': {
          'name': user['name'],
          'email': user['email'],
        }
      };
    } catch (e) {
      print("MockAuth: Falha no login.");
      throw Exception('Email ou senha inválidos!');
    }
  }

  Future<void> register(String name, String email, String password) async {
    print("MockAuth: Tentando registrar $name...");
    
    await Future.delayed(const Duration(seconds: 1));

    final exists = _fakeDatabase.any((u) => u['email'] == email);
    if (exists) {
      throw Exception('Este email já está em uso.');
    }

    _fakeDatabase.add({
      'name': name,
      'email': email,
      'password': password,
    });
    
    print("MockAuth: Usuario registrado! Total de usuários: ${_fakeDatabase.length}");
  }
}