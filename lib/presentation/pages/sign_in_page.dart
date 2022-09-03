import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            _headerWidget(),
            SizedBox(
              height: 10,
            ),
            _formWidget(),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          child: Image.asset("assets/logo.png"),
        )
      ],
    );
  }

  Widget _formWidget() {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _makeContainer("Email or phone number", false),
        SizedBox(height: 10),
        _makeContainer("Password", true),
        SizedBox(height: 15),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey[600]!, width: 2)),
          child: Text("Sign In"),
        ),
        SizedBox(
          height: 15,
        ),
        Text("Need Help?"),
        SizedBox(
          height: 15,
        ),
        Text(
          "New to Netflix? Sign up now.",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20,),
        Text(
          "Sign-in is protected by Google reCAPTHA to ensure you're not a bot. Learn more",
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    ));
  }

  Container _makeContainer(String label, bool obscureText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            labelStyle: TextStyle(fontSize: 14, color: Colors.white),
            border: InputBorder.none,
            labelText: label),
      ),
    );
  }
}
