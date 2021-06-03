import 'package:flutter/material.dart';

class StepAddress extends StatefulWidget {
  StepAddress({Key? key}) : super(key: key);

  @override
  StepAddressState createState() => StepAddressState();
}

class StepAddressState extends State<StepAddress> {
  static final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  static TextEditingController userAddress = new TextEditingController();
  static TextEditingController userState = new TextEditingController();
  static TextEditingController userCity = new TextEditingController();
  static TextEditingController userDistrict = new TextEditingController();
  static TextEditingController userPincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formStateKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Address is Required";
                }
                return null;
              },
              controller: userAddress,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "City is Required";
                }
                return null;
              },
              controller: userCity,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'District',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "District is Required";
                }
                return null;
              },
              controller: userDistrict,
            ),
            SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.toString().trim().isEmpty)
                      return "State is Required";
                  }
                  return null;
                },
                controller: userState),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Pincode',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              validator: (value) {
                if (value != null) {
                  if (value.toString().trim().isEmpty)
                    return "Pincode is Required";
                }
                return null;
              },
              controller: userPincode,
            ),
          ],
        ),
      ),
    );
  }
}
