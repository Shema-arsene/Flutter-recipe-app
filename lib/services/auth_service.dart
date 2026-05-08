import 'package:recipes_app/models/User.dart';
import 'package:recipes_app/services/http_service.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();

  final httpService = HTTPService();

  User? user;

  factory AuthService() {
    return _singleton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async {
    try {
      var response = await httpService.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );
      print(response?.statusCode);

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        user = User.fromJson(response.data);
        // print('User: $user');

        HTTPService().setup(user!.token);

        return true;
      }
    } catch (error) {
      print('AuthService login error: $error');
    }
    return false;
  }
}
