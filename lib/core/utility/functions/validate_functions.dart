// Email Validator
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'لا يجب ان يكون البريد الالكتروني فارغ';
  }

  // Regular expression for validating an email
  String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);

  if (!regex.hasMatch(email)) {
    return 'الرجاء أدخال بريد الكتروني صحيح';
  }

  return null; // Valid email
}

// Password Validator
String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'كلمة المرور فارغة';
  }

  // Check if password length is at least 8 characters
  if (password.length < 8) {
    return 'كلمة المرور يجب أن تتكون من 8 خانات على الأقل';
  }

  return null; // Valid password
}

String? validateUsername(String? username) {
  if (username == null || username.isEmpty) {
    return ' لا يجب ان يكون أسم المستخدم فارغ';
  } else if (username.length < 4) {
    return 'يجب أن يكون اسم المستخدم على الأقل 4 خانات';
  }
  return null; // Valid username
}

