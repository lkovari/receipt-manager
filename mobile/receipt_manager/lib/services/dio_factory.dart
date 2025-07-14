import 'package:dio/dio.dart';
import 'package:dio_refresh/dio_refresh.dart';
import 'package:openapi/openapi.dart';
import 'package:receipt_manager/services/constants.dart';

Future<Dio> createDioWithAuth({String baseUrl = apiBaseUrl}) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

//   dio.interceptors.add(LogInterceptor(
//   request: true,
//   requestBody: true,
//   responseBody: true,
//   responseHeader: false,
//   error: true,
//   logPrint: (obj) => print('🔍 $obj'), // optional pretty log
// ));

  final auth = AuthApi(dio, standardSerializers);

  var request = LoginRequest(
    (b) => b
      ..email = 'suzukigs500f0407@@gmail.com'
      ..password = 'AdminAdm1n65',
  );

Response<LoginResponse>? authResponse;
try{
   authResponse = await auth.loginAuthLoginPost(loginRequest: request);

}catch(e){
  return dio;
}

  final tokenManager = TokenManager.instance;
  tokenManager.setToken(
    TokenStore(
      accessToken: authResponse.data!.accessToken,
      refreshToken: authResponse.data!.refreshToken,
    ),
  );

  dio.interceptors.add(
    DioRefreshInterceptor(
      tokenManager: tokenManager,
      authHeader: (tokenStore) {
        if (tokenStore.accessToken == null) {
          return {};
        }
        return {'Authorization': 'Bearer ${tokenStore.accessToken}'};
      },
      shouldRefresh: (response) =>
          response?.statusCode == 401 || response?.statusCode == 403,
      onRefresh: (dio, tokenStore) async {
        var request = RefreshRequest(
          (b) => b.refreshToken = tokenStore.refreshToken,
        );
        final response = await auth.refreshTokenEndpointAuthRefreshPost(
          refreshRequest: request,
        );
        return TokenStore(
          accessToken: response.data!.accessToken,
          refreshToken: response.data!.refreshToken,
        );
      },
    ),
  );

  return dio;
}
