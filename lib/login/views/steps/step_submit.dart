import 'package:flutter/material.dart';

class StepSubmit extends StatefulWidget {
  final formData;
  StepSubmit({Key? key, required this.formData}) : super(key: key);

  @override
  _StepSubmitState createState() => _StepSubmitState(this.formData);
}

class _StepSubmitState extends State<StepSubmit> {
  Map<String, dynamic> formData;
  Map profileTypes = {
    2:"Doctor",
    3:"Health Care Professional",
    4:"Patient",
  };
  _StepSubmitState(this.formData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Text(
                "Full Name : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userName"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Gender : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userGender"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Date of Birth : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userDOB"].toString(), style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Address : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userAddress"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "City : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userCity"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "District : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userDistrict"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "State : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userState"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Pin Code: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userPinCode"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Aadhar: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userAadhar"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Phone : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userPhone"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Email : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userEmail"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "User Name : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userLogin"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Password : ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(formData["userPassword"], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text(
                "Profile Type: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(profileTypes[formData["profileCode"]], style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
