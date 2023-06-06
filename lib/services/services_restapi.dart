import 'package:mobile_flutter/models/user_model.dart';

abstract class ServicesRestApi {
  void contohEndpoint();

  //-------- Register Endpoint ---------
  Future<void> registerEndpoint(User user);

  //-------- Login Endpoint ---------
  Future<String> loginEndpoint(
    String email,
    String password,
  );

  //-------- Check Email Endpoint ---------
  Future<int> checkEmailValidEndpoint(String email);

  //-------- Reset Password Endpoint ---------
  Future<void> resetPasswordEndpoint(
    int userId,
    String newPassword,
  );
}
