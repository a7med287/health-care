import 'package:get_it/get_it.dart';
import 'package:health_care/constants.dart';
import 'package:health_care/core/services/api_services.dart';
import 'package:health_care/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:health_care/features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServices>(ApiServices(baseUrl: baseUrlApi));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}

