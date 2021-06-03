import 'package:flutter/material.dart';

class StepUser extends StatefulWidget {
  StepUser({Key? key}) : super(key: key);

  @override
  StepUserState createState() => StepUserState();
}

class StepUserState extends State<StepUser> {
  static final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  static TextEditingController fullName = new TextEditingController();
  static TextEditingController userAadhar = new TextEditingController();
  static TextEditingController userDOBS = new TextEditingController();
  static DateTime userDOB = DateTime.now();
  static var userGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formStateKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fullName,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Name is Required";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: userAadhar,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Aadhar Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Aadhar Number is Required";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
                value: userGender,
                items: ['Male', 'Female', 'Other']
                    .map((label) => DropdownMenuItem(
                          child: Text(label.toString()),
                          value: label,
                        ))
                    .toList(),
                // hint: Text('Gender'),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Gender',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return "Select your Gender";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    userGender = value;
                  });
                }),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: userDOBS,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    labelText: "Date of Birth",
                    // icon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value != null) {
                      if (value.toString().trim().isEmpty)
                        return "Please enter a valid date";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: userDOB,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null && picked != userDOB)
      setState(() {
        userDOB = picked.toLocal();
        var date =
            "${picked.toLocal().year}/${picked.toLocal().month}/${picked.toLocal().day}";
        userDOBS.text = date;
      });
  }
}
