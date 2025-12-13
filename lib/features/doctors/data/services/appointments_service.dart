import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../models/available_slots_response.dart';

class AppointmentsService {
  final Dio dio;

  AppointmentsService(this.dio);

  Future<AvailableSlotsResponse> getAvailableSlots({
    required String doctorId,
    required String token,
  }) async {
    final response = await dio.get(
      '/Appointments/available-slots/C846CA85-CB11-473F-BF91-420414DEDE7D',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return AvailableSlotsResponse.fromJson(response.data);
  }

  Future<String> bookAppointment({
    required String slotId,
    required String reason,
    required String token,
  }) async {
    final body = {
      "slotid": slotId,
      "reason": reason,
    };

    debugPrint("BOOK BODY ==> $body");

    final response = await dio.post(
      '/Appointments/book',
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    return response.data['appointmentid'];
  }


}
