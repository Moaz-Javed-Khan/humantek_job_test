import 'package:http/http.dart' as http;

abstract class ForgetPasswordRemoteDatasource {
  forgetPassword({
    required String email,
  });
}

class ForgetPasswordRemoteDatasourceImpl
    extends ForgetPasswordRemoteDatasource {
  @override
  forgetPassword({
    required String email,
  }) async {
    try {
      // final url = Uri.parse('$bsaeUrl/auth/user/ForgetPassword');

      final url =
          Uri.parse('https://mocki.io/v1/3f0b2384-6d63-40fd-8069-67d5fa47131c');

      // final data = json.encode({
      //   "emailAddress": email,
      // });

      final response = await http.get(
        url,
        // body: data,
        // headers: {'Content-Type': 'application/json'},
      );

      print('Response: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('ForgetPassword successfully');
        print('Response: ${response.body}');

        return response.body;

        // Future.delayed(
        //   const Duration(seconds: 1),
        // );

        // return {
        //   "name": "moaz",
        //   "email": "moaz@yahoo.com",
        //   "token": "abcabc",
        // };
      } else {
        print('Failed to Forget Password');
        // throw Exception(jsonDecode(response.body)['message'].toString());
        throw Exception("Failed To Forget Password");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
