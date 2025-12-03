import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_cubit.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_state.dart';
import 'package:health_care/features/clinic/Presentation/widgets/grid_list_view.dart';
import 'package:health_care/features/clinic/Presentation/widgets/specialty_dropdown%20.dart';


class ClinicViewBody extends StatelessWidget {
  const ClinicViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SpecialtyDropdown(),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<ClinicCubit, ClinicState>(
              builder: (context, state) {
                if (state is ClinicLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ClinicFailure) {
                  return Center(child: Text("Error: ${state.error}"));
                } else if (state is ClinicSuccess) {
                  final clinics = state.clinics;
                  if (clinics.isEmpty) {
                    return const Center(child: Text("لا توجد عيادات لعرضها"));
                  }
                  return ClinicsGridView(clinics: clinics);
                }
                
                return Center(
                  child: ElevatedButton(
                    onPressed: () => context.read<ClinicCubit>().getAllClinics(),
                    child: const Text("تحميل العيادات"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
