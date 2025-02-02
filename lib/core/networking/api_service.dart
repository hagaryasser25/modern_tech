/*
import 'package:dio/dio.dart';
import 'package:students/features/more/model/data/contact_us_response.dart';

import '../../features/app_info/data/app_info_response.dart';
import '../../features/cart/data/model/add_to_cart/add_to_cart_request.dart';
import '../../features/cart/data/model/parents/parents_request.dart';
import '../../features/cart/data/model/pay_order/pay_order_request.dart';
import '../../features/cart/data/model/promo_code/promo_code_request.dart';
import '../../features/cart/data/model/promo_code/promo_code_response.dart';
import '../../features/cart/data/model/send_order_to_parent/send_order_data.dart';
import '../../features/cart/data/model/show_cart/show_cart_response.dart';
import '../../features/directorates/data/model/directorates_response.dart';
import '../../features/edit_profile/model/data/check_password_request.dart';
import '../../features/edit_profile/model/data/check_password_response.dart';
import '../../features/edit_profile/model/data/reset_email_or_phone_request.dart';
import '../../features/edit_profile/model/data/reset_email_or_phone_response.dart';
import '../../features/edit_profile/model/data/verified_email_or_phone_response.dart';
import '../../features/edit_profile/model/data/verified_request.dart';
import '../../features/education_type/data/model/education_type_response.dart';
import '../../features/forget_password/model/data/check_otp_request.dart';
import '../../features/forget_password/model/data/check_otp_response.dart';
import '../../features/forget_password/model/data/forget_password_request.dart';
import '../../features/forget_password/model/data/forget_password_response.dart';
import '../../features/forget_password/model/data/reset_password_request.dart';
import '../../features/forget_password/model/data/reset_password_response.dart';
import '../../features/governorates/data/model/governorates_response.dart';
import '../../features/grades/data/model/grades_response.dart';
import '../../features/home_screen/data/model/subjects_response.dart';
import '../../features/login/model/data/login_request.dart';
import '../../features/login/model/data/login_response.dart';
import '../../features/login/model/data/logout_response.dart';
import '../../features/more/model/data/add_parent_request.dart';
import '../../features/more/model/data/add_parent_response.dart';
import '../../features/more/model/data/delete_account_response.dart';
import '../../features/more/model/data/delete_parent_request.dart';
import '../../features/more/model/data/delete_parent_response.dart';
import '../../features/more/model/data/parent_profile_request.dart';
import '../../features/more/model/data/parent_profile_response.dart';
import '../../features/more/model/data/points_response.dart';
import '../../features/more/model/data/your_opinion_data.dart';
import '../../features/notifications/model/data/approve_notification_data.dart';
import '../../features/notifications/model/data/approve_notification_request.dart';
import '../../features/notifications/model/data/notification_data_request.dart';
import '../../features/on_boarding/model/data/on_boarding_response.dart';
import '../../features/past_purchases/data/model/past_purchases_response.dart';
import '../../features/past_purchases/data/model/report_issue_data.dart';

import '../../features/questions/data/models/answer_models/answer_body_request.dart';
import '../../features/questions/data/models/question_model/questions_data_request.dart';
import '../../features/questions/data/models/question_model/questions_model_response.dart';
import '../../features/register/data/model/resend_otp.dart';
import '../../features/register/data/model/verify_otp.dart';
import '../../features/register/data/model/verify_otp_response.dart';
import '../../features/reports/data/model/reports_response.dart';
import '../../features/scan_barcode/data/model/scan_barcode_request.dart';
import '../../features/slider/model/data/slider_response.dart';
import '../../features/subjects/data/model/subject_tree_response.dart';
import '../models/success_response.dart';
import 'api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.getAppInfo)
  Future<AppInfoResponse> getAppInfo(@Header("Authorization") String? token);

  @GET(ApiConstants.getOnBoarding)
  Future<OnBoardingResponse> getOnBoarding();

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequest loginRequestBody,
    @Header('fcm-token') String fcmToken,
  );

  @GET(ApiConstants.educationType)
  Future<EductionTypeResponse> getEducationType(
      @Header("Authorization") String token);

  @GET(ApiConstants.getGovernorates)
  Future<GovernoratesResponse> getGovernorates(
      @Header("Authorization") String token);

  @GET(ApiConstants.getDirectorates)
  Future<DirectoratesResponse> getDirectorates(
      @Path("id") int id, @Header("Authorization") String token);

  @GET(ApiConstants.getGrades)
  Future<GradesResponse> getGrades(@Header("Authorization") String token);

  @POST(ApiConstants.register)
  Future<LoginResponse> register(
    @Body() FormData formData,
    @Header("fcm_token") String fcmToken,
    @Header("lang") String lang,
  );

  @POST(ApiConstants.sendCode)
  Future<ForgetPasswordResponse> sendCode(
    @Body() ForgetPasswordRequest forgetPasswordRequest,
  );

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOTPResponse> verifyAccount(
      @Body() VerifyOtpRequestBody verifyOtpRequestBody,
      @Header("Authorization") String token);

  @POST(ApiConstants.checkOtp)
  Future<CheckOtpResponse> checkOtp(@Body() CheckOtpRequest checkOtpRequestBody,
      @Header("token") String token);

  @POST(ApiConstants.resendOtp)
  Future<ResentOTPResponse> resendOTP(
      @Header("Authorization") String token, @Body() ResendOtpModel resendOtp);

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Header('token') String token,
    @Body() ResetPasswordRequest resetPasswordData,
  );

  @POST(ApiConstants.resetPasswordEditProfile)
  Future<ResetPasswordResponse> changePassword(
    @Header('Authorization') String token,
    @Body() ResetPasswordRequest changePasswordData,
  );

  @POST(ApiConstants.checkPassword)
  Future<CheckPasswordResponse> checkPassword(
    @Header('Authorization') String token,
    @Body() CheckPasswordRequest changePasswordData,
  );

  @POST(ApiConstants.resetEmailOrPhone)
  Future<ResetEmailOrPhoneResponse> checkEmailOrPhone(
    @Header('Authorization') String token,
    @Body() ResetEmailOrPhoneRequest changeMailPhoneData,
  );

  @POST(ApiConstants.verifiedPhone)
  Future<VeifiedEmailOrPhoneResponse> verifyPhone(
    @Header('Authorization') String token,
    @Body() VerifiedRequest verifiedPhone,
  );

  @POST("/student/verified_email")
  Future<VeifiedEmailOrPhoneResponse> verifyEmail(
    @Header('Authorization') String token,
    @Body() VerifiedRequest verifiedEmail,
  );

  @POST(ApiConstants.updateProfile)
  Future<LoginResponse> updateProfile(
    @Body() FormData formData,
    @Header("Authorization") String token,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponse> logout(
    @Header('Authorization') String token,
    @Header('device-id') String serialNumber,
  );

  @GET(ApiConstants.getPoints)
  Future<PointsResponse> getPoints(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getProfile)
  Future<LoginResponse> getProfileData(@Header('Authorization') String token);

  @GET(ApiConstants.getSlider)
  Future<SliderResponse> getSlider(@Header("Authorization") String token);

  @GET(ApiConstants.getSubjects)
  Future<SubjectsModelResponse> getSubjects(
      @Header("Authorization") String token);

  @GET(ApiConstants.getReports)
  Future<ReportsResponse> getReports(@Header("Authorization") String token);

  @GET(ApiConstants.getSubjectTree)
  Future<SubjectTreeResponse> getSubjectTree(
      @Header("Authorization") String token,
      @Query('subject_id') int subjectId);

  @POST(ApiConstants.scanBarCode)
  Future<SuccessResponse> scanBarCode(
    @Header("Authorization") String token,
    @Body() ScanBarcodeRequest scanBarcodeRequest,
  );

  @POST(ApiConstants.addToCart)
  Future<SuccessResponse> addToCart(
    @Header("Authorization") String token,
    @Body() AddToCartRequest addToCartRequest,
  );

  @GET(ApiConstants.showCart)
  Future<ShowCartResponse> showCart(@Header("Authorization") String token);

  @DELETE(ApiConstants.deleteSubject)
  Future<SuccessResponse> deleteSubject(
    @Header("Authorization") String token,
    @Body() CartSubjectItem cartSubjectItem,
  );

  @POST(ApiConstants.applyPromoCode)
  Future<PromoCodeResponse> applyPromoCode(
    @Header("Authorization") String token,
    @Body() PromoCodeRequest promoCodeRequest,
  );

  @POST(ApiConstants.saveOrder)
  Future<SuccessResponse> saveOrder(
    @Header("Authorization") String token,
    @Body() PayOrderRequest payOrderRequest,
  );

  @POST(ApiConstants.deleteParent)
  Future<DeleteParentResponse> deleteParent(
    @Header('Authorization') String token,
    @Body() DeleteParentRequest deleteParentData,
  );

  @POST(ApiConstants.confirmParent)
  Future<ParentProfileResponse> getParentProfile(
    @Header('Authorization') String token,
    @Body() ParentProfileRequest parentProfileRequest,
  );

  @POST(ApiConstants.addParent)
  Future<AddParentResponse> addParent(
    @Header('Authorization') String token,
    @Body() AddParentRequest addParentRequest,
  );

  @GET(ApiConstants.getParents)
  Future<ParentsAndTeacherRequest> getParents(
      @Header("Authorization") String token);

  @GET(ApiConstants.getNotifications)
  Future<NotificationDataRequest> getNotifications(
      @Header("Authorization") String token);

  @POST(ApiConstants.approveNotification)
  Future<ApproveNotificationRequest> approveNotification(
    @Header("Authorization") String token,
    @Body() ApproveNotificationData approveNotificationData,
  );

  @POST(ApiConstants.sendOrderToParent)
  Future<SuccessResponse> sendOrderToParent(
    @Header("Authorization") String token,
    @Body() SendOrderData sendOrderData,
  );

  @POST(ApiConstants.deleteAccount)
  Future<DeleteAccountResponse> deleteAccount(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.contactUs)
  Future<ContactUsResponse> getContactInfo(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.getPastPurchases)
  Future<PastPurchasesResponse> getPastPurchases(
      @Header("Authorization") String token);

  @POST(ApiConstants.reportIssue)
  Future<SuccessResponse> reportIssue(
    @Header("Authorization") String token,
    @Body() ReportIssueData reportIssueData,
  );

  @POST(ApiConstants.sendOpinion)
  Future<SuccessResponse> sendOpinion(
    @Header("Authorization") String token,
    @Body() YourOpinionData yourOpinionData,
  );

  @POST(ApiConstants.getQuestions)
  Future<QuestionResponse> getQuestions(
    @Header("Authorization") String token,
    @Body() QuestionsDataRequest questionsDataRequest,
  );

  @POST(ApiConstants.storeAnswers)
  Future<SuccessResponse> storeAnswers(
    @Header("Authorization") String token,
    @Body() AnswerBodyRequest answerBodyRequest,
  );
}
*/
