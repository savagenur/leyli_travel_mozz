import 'package:get_it/get_it.dart';
import 'package:leyli_travel_mozz/app/router/app_router.dart';

final GetIt sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerSingleton<AppRouter>(AppRouter());

}
