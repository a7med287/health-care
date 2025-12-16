import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/local_appointment_model.dart';

class LocalAppointmentService {
  static const String _key = "user_appointments";

  /// save new appointment
  Future<void> saveAppointment(
      LocalAppointmentModel appointment) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> existing =
        prefs.getStringList(_key) ?? [];

    existing.add(jsonEncode(appointment.toJson()));

    await prefs.setStringList(_key, existing);
  }

  /// get all appointments
  Future<List<LocalAppointmentModel>> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> list =
        prefs.getStringList(_key) ?? [];

    return list
        .map((e) =>
            LocalAppointmentModel.fromJson(jsonDecode(e)))
        .toList();
  }

  /// clear appointments (optional)
  Future<void> clearAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
