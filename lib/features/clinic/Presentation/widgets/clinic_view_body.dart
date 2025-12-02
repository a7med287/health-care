import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_cubit.dart';
import 'package:health_care/features/clinic/Data/clinic_cubit/clinic_state.dart';

import 'package:health_care/features/clinic/Presentation/widgets/grid_list_view.dart';


class ClinicViewBody extends StatelessWidget {
  const ClinicViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClinicCubit, ClinicState>(
      builder: (context, state) {
        if (state is ClinicLoading) {
          return Center(child: CircularProgressIndicator());
        } 
        else if (state is ClinicSuccess) {
          return CustomScrollView(
            slivers: [
              ClinicsGridView(clinics: state.clinics),
            ],
          );
        }
        else if (state is ClinicFailure) {
          return Center(child: Text("Error: ${state.error}"));
        }

        return Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<ClinicCubit>().getClinics();
            },
            child: Text("Load Clinics"),
          ),
        );
      },
    );
  }
}
