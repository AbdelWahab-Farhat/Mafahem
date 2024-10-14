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

String? validateLibyanPhoneNumber(String? phoneNumber) {
  // Check if the phone number is null or empty
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return 'لا يجب أن يكون رقم الهاتف فارغاً'; // "Phone number cannot be empty"
  }
  // Check if the phone number matches the Libyan format
  else if (!RegExp(r'^0(91|92|93|94|95|96|97|98|99)\d{7}$').hasMatch(phoneNumber)) {
    return 'رقم الهاتف غير صحيح. يجب أن يبدأ ب 0 ويتبع برمز المنطقة ثم 7 أرقام'; // "Invalid phone number. It must start with 0, followed by an area code and then 7 digits"
  }
  return null; // Valid phone number
}

String? validateMultiLineInput(String? input) {
  if (input == null || input.isEmpty) {
    return 'لا يجب أن يكون الحقل فارغاً';
  }

  List<String> lines = input.split('\n');
  if (lines.length < 3) {
    return 'يجب أن تحتوي المدخلات على 3 سطور على الأقل';
  }

  return null;
}