import 'package:aabkr/controllers/reset_pass_Controller.dart';
import 'package:aabkr/controllers/update_user_controller.dart';

/// Handles the update of user personal data and password reset if needed.
///
/// This function updates the user's personal data and, if a new password is provided, also handles the password reset process.
///
/// Parameters:
///   - name: The user's name.
///   - fName: The user's father's name.
///   - age: The user's age.
///   - email: The user's email.
///   - password: The user's new password (optional).
///   - confirmPassword: Confirmation of the new password (optional).
///   - phone: The user's phone number.
///   - token: The authentication token of the user.
///
/// Returns:
///   - A JSON string containing a message and success status.
///
/// Note: The success status indicates whether the update operation was successful or not.

handleUserDataUpdate(String name, String fName, String age, String email, String password, String confirmPassword, String phone, String token) async{
  if(password != confirmPassword){
    return {"success" : false, "message":"كلمه المرور غير متطابقه"};
  }
  else if(password == "" && confirmPassword == ""){
    var update = await updateUserPersonalData(name, email, phone, fName, age, token);
    if(update){
      return {"message":"تم تحديث البيانات بنجاح","success" : true};
    }
    else{
      return {"message":"حدث خطأ أثناء تحديث البيانات","success" : false};
    }
  }
  else if(password != "" && confirmPassword != "" && password == confirmPassword){
    var update = await resetPasswordController(email, password, confirmPassword, token);
    if(update)
    {
      update = await updateUserPersonalData(name, email, phone, fName, age, token);
      if(update){
      return {"message":"تم تحديث البيانات بنجاح", "success" : true};
    }
    else{
      return {"message":"حدث خطأ أثناء تحديث البيانات", "success" : false};
    }
    }
    else
    {
      return  {"message":"حدث خطأ أثناء تحديث كلمه المرور", "success" : false};
    }
  }
  else{
    return {"message" : "حدث خطأ أثناء تحديث البيانات", "success" : false};
  }

}