import 'package:get_it/get_it.dart';
import 'package:split_save/services/FirestoreService.dart';
import '../services/AuthenticationService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
