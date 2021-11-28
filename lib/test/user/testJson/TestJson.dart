import 'dart:convert';

import '../testModelUser/test_user_model.dart';

class TestJson {
  static int?  loginPage({String? mail, String? password}) {
    final String jsonPath = """
    [
    {
        "mail": "elgiz@gmail.com",
        "password": "Salam1234@",
        "status": 1
    },
    {
        "mail": "ulvi@gmail.com",
        "password": "Salam1234@",
        "status": 0
    }
]
    
    """;
    List<dynamic> jsonDoc = jsonDecode(jsonPath);
    final List<TestUserModel> items =
        jsonDoc.map((e) => TestUserModel.fromJson(e)).toList();

    for (var item in items) {
      if (item.mail == mail && item.password == password) {
        return item.status;
      }
    }

    return 3;
  }
}
