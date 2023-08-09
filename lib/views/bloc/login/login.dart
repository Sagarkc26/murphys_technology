// import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

// enum LoginStatus { initial, loading, success, error }

// class LoginState {
//   final LoginStatus status;
//   final String? referralCode;

//   LoginState({
//     required this.status,
//     this.referralCode,
//   });
// }

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginState(status: LoginStatus.initial));

//   Future<void> loginUser(String email, String password) async {
//     emit(state.copyWith(status: LoginStatus.loading));

//     final url = Uri.parse('http://your-server-url/login');
//     final response = await http.post(url, body: {
//       'email': email,
//       'password': password,
//     });

//     if (response.statusCode == 200) {
//       final responseBody = json.decode(response.body);
//       final referralCode = responseBody['referralCode'];

//       emit(state.copyWith(
//         status: LoginStatus.success,
//         referralCode: referralCode,
//       ));
//     } else {
//       emit(state.copyWith(status: LoginStatus.error));
//     }
//   }
// }
