import '../constant/constant.dart';

class ServiceUrl {
  static const API_CODE_SUCCESS = '200';
  static String userLogin = Constant.userServiceUrl + '/userservice/login';
  static String getUserInfo =
      Constant.userServiceUrl + '/userservice/getUserInfo';
  static String getUserList = Constant.userServiceUrl + '/userservice/user';
}
