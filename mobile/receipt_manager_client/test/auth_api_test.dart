import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    // Login
    //
    //Future<LoginResponse> loginAuthLoginPost(LoginRequest loginRequest) async
    test('test loginAuthLoginPost', () async {
      // TODO
    });

    // Refresh Token Endpoint
    //
    //Future<LoginResponse> refreshTokenEndpointAuthRefreshPost(RefreshRequest refreshRequest) async
    test('test refreshTokenEndpointAuthRefreshPost', () async {
      // TODO
    });

  });
}
