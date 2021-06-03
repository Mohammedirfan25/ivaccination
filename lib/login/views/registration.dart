import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:ivaccination/login/models/user.dart';
import 'package:ivaccination/login/views/steps/step_account.dart';
import 'package:ivaccination/login/views/steps/step_address.dart';
import 'package:ivaccination/login/views/steps/step_submit.dart';
import 'package:ivaccination/login/views/steps/step_user.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final UserDB _userDB = UserDB();
  var users;
  Map profilecodes = {"Doctor": 2, "Health Care Professional": 3, "Patient": 4};
  Map<String, dynamic> _formData = Map<String, dynamic>();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _checkConnectivity().then((value) {
      if (value) {
        _userDB.fetchUsers().then((value) {
          if (value is List<User>) {
            setState(() {
              users = value;
            });
            print(users);
          } else {
            _showSnackBar(value);
          }
        });
      } else {
        _showSnackBar("Think your not connected to internet");
      }
    });
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  bool _checkAadharAvailability(aadhar) {
    bool isAvailabel = false;
    if (users != null) {
      users.forEach((value) {
        if (value.userAadhar == aadhar) {
          isAvailabel = true;
        }
      });
    }
    return isAvailabel;
  }

  @override
  Widget build(BuildContext context) {
    _formData["userName"] = StepUserState.fullName.text;
    _formData["userGender"] = StepUserState.userGender != null
        ? StepUserState.userGender[0]
        : StepUserState.userGender;
    _formData["userDOB"] = StepUserState.userDOB;
    _formData["userAddress"] = StepAddressState.userAddress.text;
    _formData["userCity"] = StepAddressState.userCity.text;
    _formData["userDistrict"] = StepAddressState.userDistrict.text;
    _formData["userState"] = StepAddressState.userState.text;
    _formData["userPinCode"] = StepAddressState.userPincode.text;
    _formData["userAadhar"] = StepUserState.userAadhar.text;
    _formData["userPhone"] = StepAccountState.userPhone.text;
    _formData["userEmail"] = StepAccountState.userEmail.text;
    _formData["userLogin"] = StepAccountState.userName.text;
    _formData["userPassword"] = StepAccountState.userPassword.text;
    _formData["profileCode"] = StepAccountState.profileCode != null
        ? profilecodes[StepAccountState.profileCode]
        : StepAccountState.profileCode;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        physics: ScrollPhysics(),
        controlsBuilder: (BuildContext context,
            {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _index == 3 // this is the last step
                    ? ElevatedButton(
                        onPressed: _submit,
                        child: Text("SUBMIT"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                      )
                    : ElevatedButton(
                        onPressed: onStepContinue,
                        child: Text("CONTINUE"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)))),
                      ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  child: Text("CANCEL"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                  ),
                  onPressed: onStepCancel,
                )
              ],
            ),
          );
        },
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index == 0) {
            var state = StepUserState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index += 1;
                });
              }
            }
          } else if (_index == 1) {
            var state = StepAddressState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index += 1;
                });
              }
            }
          } else if (_index == 2) {
            var state = StepAccountState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index += 1;
                });
              }
            }
          }
        },
        onStepTapped: (int index) {
          if (_index == 0) {
            var state = StepUserState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index = index;
                });
              }
            }
          } else if (_index == 1) {
            var state = StepAddressState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index = index;
                });
              }
            }
          } else if (_index == 2) {
            var state = StepAccountState.formStateKey.currentState;
            if (state != null) {
              if (state.validate()) {
                setState(() {
                  _index = index;
                });
              }
            }
          } else {
            setState(() {
              _index = index;
            });
          }
        },
        steps: [
          Step(
            title: Text("User"),
            content: StepUser(),
            state: _index == 0 ? StepState.editing : StepState.indexed,
            isActive: true,
          ),
          Step(
            title: Text("Address"),
            content: StepAddress(),
            state: _index == 1 ? StepState.editing : StepState.indexed,
            isActive: true,
          ),
          Step(
            title: Text("Account"),
            content: StepAccount(),
            state: _index == 2 ? StepState.editing : StepState.indexed,
            isActive: true,
          ),
          Step(
            title: Text("Submit"),
            content: StepSubmit(
              formData: _formData,
            ),
            state: StepState.complete,
            isActive: true,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submit() {
    User user = User.fromMap(_formData);

    _userDB.createUser(user).then((value) {
      if (value is User) {
        _showSnackBar("User success fully created");
      } else {
        _showSnackBar(value);
      }
    });
  }
}

