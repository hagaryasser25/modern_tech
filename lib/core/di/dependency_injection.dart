
/*
final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // AppInfo
  getIt.registerLazySingleton<AppInfoRepo>(() => AppInfoRepo(getIt()));
  getIt.registerFactory<AppInfoCubit>(() => AppInfoCubit(getIt()));
  // onBoarding
  getIt.registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepo(getIt()));
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit(getIt()));
  // More
  getIt.registerLazySingleton<MoreRepo>(() => MoreRepo(getIt()));
  getIt.registerFactory<MoreCubit>(() => MoreCubit(getIt()));
  // Register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //educationType
  getIt.registerLazySingleton<EducationTypeRepo>(
      () => EducationTypeRepo(getIt()));
  getIt.registerFactory<EducationTypeCubit>(() => EducationTypeCubit(getIt()));
  //governorate
  getIt
      .registerLazySingleton<GovernoratesRepo>(() => GovernoratesRepo(getIt()));
  getIt.registerFactory<GovernoratesCubit>(() => GovernoratesCubit(getIt()));
  //directorates
  getIt
      .registerLazySingleton<DirectoratesRepo>(() => DirectoratesRepo(getIt()));
  getIt.registerFactory<DirectoratesCubit>(() => DirectoratesCubit(getIt()));
  //grades
  getIt.registerLazySingleton<GradesRepo>(() => GradesRepo(getIt()));
  getIt.registerFactory<GradesCubit>(() => GradesCubit(getIt()));
  //Home OTP
  getIt.registerLazySingleton<VerifyAccountRepo>(
      () => VerifyAccountRepo(getIt()));
  getIt.registerFactory<VerifyAccountCubit>(() => VerifyAccountCubit(getIt()));
  //Edit Profile
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));
  //Carousel
  getIt.registerLazySingleton<SliderRepo>(() => SliderRepo(getIt()));
  getIt.registerFactory<SliderCubit>(() => SliderCubit(getIt()));
  //Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  //reports
  getIt.registerLazySingleton<ReportsRepo>(() => ReportsRepo(getIt()));
  getIt.registerFactory<ReportsCubit>(() => ReportsCubit(getIt()));
  //Subject Tree
  getIt.registerLazySingleton<SubjectTreeRepo>(() => SubjectTreeRepo(getIt()));
  getIt.registerFactory<SubjectTreeCubit>(() => SubjectTreeCubit(getIt()));
  //Forget Password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  // Scan Barcode
  getIt.registerLazySingleton<ScanBarcodeRepo>(() => ScanBarcodeRepo(getIt()));
  getIt.registerFactory<ScanBarcodeCubit>(() => ScanBarcodeCubit(getIt()));
  // cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  // cart
  getIt.registerLazySingleton<PromoCodeRepo>(() => PromoCodeRepo(getIt()));
  getIt.registerFactory<PromoCodeCubit>(() => PromoCodeCubit(getIt()));

  // notifications
  getIt.registerLazySingleton<NotificationsRepo>(() => NotificationsRepo(getIt()));
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));

  // past purchases
  getIt.registerLazySingleton<PastPurchasesRepo>(() => PastPurchasesRepo(getIt()));
  getIt.registerFactory<PastPurchasesCubit>(() => PastPurchasesCubit(getIt()));

  // Questions
  getIt.registerLazySingleton<QuestionsRepo>(() => QuestionsRepo(getIt()));
  getIt.registerFactory<QuestionsCubit>(() => QuestionsCubit(getIt()));
}
*/
