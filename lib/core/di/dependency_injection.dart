

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:modern_tech/features/registertaion/data/repo/register_repo.dart';

import '../../features/registertaion/logic/register_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // AppInfo
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory <RegisterCubit>(() => RegisterCubit(getIt()));


}

