import 'package:anilib/repositories/auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  AuthController() : _authRepository = AuthRepository();

  @override
  void onInit() {
    super.onInit();
    auth(mail: "markus.katilov@mail.ru", passwd: "passwd123");
  }

  void auth({required String mail, required String passwd}) {
    _authRepository.fetch(mail: mail, passwd: passwd);
  }
}
