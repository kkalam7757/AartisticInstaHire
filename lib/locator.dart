import 'package:aartistic/services/authentication_service.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/firestore_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}