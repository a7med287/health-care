import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/utils/app_colors.dart';
import 'package:health_care/features/appointments/data/models/available_slot_model.dart';
import 'package:health_care/features/appointments/data/repo/available_slots_repo_impl.dart';
import 'package:health_care/features/appointments/data/repo/booking_repo_impl.dart';
import 'package:health_care/features/appointments/presentation/cubits/available_slots_cubit/available_slots_cubit.dart';
import 'package:health_care/features/appointments/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:intl/intl.dart';

/// Dialog widget for booking appointments with a doctor
/// 
/// This dialog allows users to:
/// - Select a date for the appointment
/// - View and select from available time slots fetched from the API
/// - Enter a reason for the visit
/// - Submit the booking request via the BookingCubit
class BookingDialog extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String image;
  final String address;
  final String doctorId; // Required: Doctor ID to fetch available slots

  const BookingDialog({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.image,
    required this.address,
    required this.doctorId,
  });

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  AvailableSlotModel? _selectedSlot;
  final TextEditingController _reasonController = TextEditingController();
  DateTime _selectedDate = DateTime.now(); // Default to today

  /// Formats a DateTime to YYYY-MM-DD string format for the API
  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Fetch available slots when dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AvailableSlotsCubit>().fetchAvailableSlots(
            doctorId: widget.doctorId,
            date: _formatDate(_selectedDate),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).viewInsets +
        const EdgeInsets.symmetric(horizontal: 24, vertical: 24);

    // Provide both BookingCubit and AvailableSlotsCubit to the dialog
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookingCubit(BookingRepoImpl()),
        ),
        BlocProvider(
          create: (context) => AvailableSlotsCubit(AvailableSlotsRepoImpl()),
        ),
      ],
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding: EdgeInsets.zero,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: mediaPadding,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: MultiBlocListener(
                  listeners: [
                    // Listen to booking state changes
                    BlocListener<BookingCubit, BookingState>(
                      listener: (context, state) {
                        if (state is BookingSuccess) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.message ?? 'Appointment booked successfully',
                              ),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else if (state is BookingFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                    ),
                    // Listen to available slots state changes
                    BlocListener<AvailableSlotsCubit, AvailableSlotsState>(
                      listener: (context, state) {
                        if (state is AvailableSlotsFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.orange,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: BlocBuilder<BookingCubit, BookingState>(
                          builder: (context, bookingState) {
                            final isBooking = bookingState is BookingLoading;
                            return IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: isBooking
                                  ? null
                                  : () => Navigator.pop(context),
                              icon: const Icon(Icons.close, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Book Appointment With ${widget.doctorName}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Date Selection
                      const Text(
                        'Select date:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          if (pickedDate != null && pickedDate != _selectedDate) {
                            setState(() {
                              _selectedDate = pickedDate;
                              _selectedSlot = null; // Reset selected slot when date changes
                            });
                            // Fetch slots for the new date
                            context.read<AvailableSlotsCubit>().fetchAvailableSlots(
                                  doctorId: widget.doctorId,
                                  date: _formatDate(_selectedDate),
                                );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('MMMM dd, yyyy').format(_selectedDate),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              const Icon(Icons.calendar_today, size: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Select an available slot:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Available Slots Dropdown
                      BlocBuilder<AvailableSlotsCubit, AvailableSlotsState>(
                        builder: (context, slotsState) {
                          if (slotsState is AvailableSlotsLoading) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (slotsState is AvailableSlotsSuccess) {
                            final slots = slotsState.slots;
                            if (slots.isEmpty) {
                              return Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'No available slots for this date',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            }
                            return DropdownButtonFormField<AvailableSlotModel>(
                              value: _selectedSlot,
                              decoration: _inputDecoration(),
                              hint: const Text('Select a slot'),
                              items: slots
                                  .map(
                                    (slot) => DropdownMenuItem(
                                      value: slot,
                                      child: Text(slot.displayText),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedSlot = value;
                                });
                              },
                            );
                          } else if (slotsState is AvailableSlotsFailure) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    slotsState.errorMessage,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(height: 8),
                                  TextButton(
                                    onPressed: () {
                                      context.read<AvailableSlotsCubit>().fetchAvailableSlots(
                                            doctorId: widget.doctorId,
                                            date: _formatDate(_selectedDate),
                                          );
                                    },
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Select a date to view available slots',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Reason for visit:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<BookingCubit, BookingState>(
                        builder: (context, bookingState) {
                          final isBooking = bookingState is BookingLoading;
                          return TextField(
                            controller: _reasonController,
                            maxLines: 5,
                            enabled: !isBooking,
                            decoration: _inputDecoration(
                              hintText: 'Describe your reason...',
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<BookingCubit, BookingState>(
                        builder: (context, bookingState) {
                          final isBooking = bookingState is BookingLoading;
                          return ElevatedButton(
                            onPressed: (_selectedSlot == null || isBooking)
                                ? null
                                : () => _handleConfirmBooking(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: isBooking
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Confirm Booking',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<BookingCubit, BookingState>(
                        builder: (context, bookingState) {
                          final isBooking = bookingState is BookingLoading;
                          return OutlinedButton(
                            onPressed: isBooking
                                ? null
                                : () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text('Close'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Handles the booking confirmation
  /// 
  /// This method:
  /// 1. Validates that a slot and reason are provided
  /// 2. Calls the BookingCubit to book the appointment using the actual slotId
  /// 3. The cubit will handle the API call and emit appropriate states
  void _handleConfirmBooking(BuildContext context) {
    // Validate inputs
    if (_selectedSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a time slot'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_reasonController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a reason for your visit'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Get the BookingCubit from context and book the appointment
    // Use the actual slotId from the API response
    context.read<BookingCubit>().bookAppointment(
          slotId: _selectedSlot!.slotId,
          reason: _reasonController.text.trim(),
        );
  }

  InputDecoration _inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.mainColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}