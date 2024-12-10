import 'package:frute_hup/core/services/firestore_services.dart';
import 'package:frute_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repos/auth_repo_ipm.dart';
import 'database_services.dart';
import 'firebase_auth_services.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  sl.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());

  sl.registerSingleton<DatabaseServices>(FirestoreServices());
  sl.registerSingleton<AuthRepo>(AuthRepoIpm(
    databaseServices: sl<DatabaseServices>(),
    firebaseAuthServices: sl<FirebaseAuthServices>(),
  ));
}
