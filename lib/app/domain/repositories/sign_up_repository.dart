import 'package:places_autocomplete/app/domain/inputs/sign_up.dart';

import '../response/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register (SignUpData data);
}

