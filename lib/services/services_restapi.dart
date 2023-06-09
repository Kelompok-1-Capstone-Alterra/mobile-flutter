import 'dart:io';

import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/models/plant_stats_model.dart';
import 'package:mobile_flutter/models/profile_model.dart';

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
  Future<ProfileModel> getProfile();

  Future<void> putImage(File file);

  Future<void> changeName(String newName);

  Future<void> changePassword(String newPassword);

  Future<List<PlantStatsModel>> getPlantStats(String status);

  Future<void> sendComplaintEmails(String phone, String email, String message);

  Future<void> sendSuggestion(String message);
}
