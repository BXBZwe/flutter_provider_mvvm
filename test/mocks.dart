import 'package:mockito/annotations.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view_model.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';
import 'package:demo_provider_mvvm/src/common/app_config.dart';

@GenerateMocks(
    [UserService, SignUpViewModel, LoginViewModel, AuthProvider, ThemeManager])
void main() {}
