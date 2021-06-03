import 'package:flutter/material.dart';

class StepAccount extends StatefulWidget {
  StepAccount({Key? key}) : super(key: key);

  @override
  StepAccountState createState() => StepAccountState();
}

class StepAccountState extends State<StepAccount> {
  static final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  static TextEditingController userName = new TextEditingController();
  static TextEditingController userEmail = new TextEditingController();
  static TextEditingController userPhone = new TextEditingController();
  static TextEditingController userPassword = new TextEditingController();
  static TextEditingController userConfirmPassword =
      new TextEditingController();
  static var profileCode;
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formStateKey,
        child: Column(
          children: [
            TextFormField(
              controller: userName,
              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "User Name is Required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              value: profileCode,
              items: ['Doctor', 'Health Care Professional', 'Patient']
                  .map((label) => DropdownMenuItem(
                        child: Text(label.toString()),
                        value: label,
                      ))
                  .toList(),
              // hint: Text('Gender'),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Proile Type',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  return "Select your profile type";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  profileCode = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Email is Required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userPhone,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "phone is Required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userPassword,
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  child: Icon(
                    _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Password is Required";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userConfirmPassword,
              obscureText: _isConfirmPasswordHidden,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
                    });
                  },
                  child: Icon(
                    _isConfirmPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty) {
                    return "this field is required";
                  }
                }

                if (userPassword.text != userConfirmPassword.text) {
                  return "password didn't match ";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
