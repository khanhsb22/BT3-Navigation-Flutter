import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fultterapp/layout.dart';
import 'package:fultterapp/nav_drawer.dart';

import 'hex_color.dart';

void main() {
  runApp(MaterialApp(title: "BT3-Navigation", home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color purpleColor = HexColor("773FB2");
  Color purpleColor_2 = HexColor("F3EAFF");
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
        resizeToAvoidBottomInset: false, // Không để thuộc tính này thì khi nhập dữ liệu từ
        // TextField thì các Widget trong form sẽ chồi lên
        appBar: AppBar(
          backgroundColor: purpleColor,
          title: Text("Login"),
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120.0,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.0,
                  ),
                  Image.asset(
                    "images/person_image.jpg",
                    width: 150,
                    height: 150,
                  )
                ],
              ),
            ),
            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  margin: EdgeInsets.only(bottom: 80.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: "Your Email",
                          hintStyle:
                              TextStyle(color: purpleColor, fontSize: 18),
                          fillColor: purpleColor_2,
                          filled: true,
                          prefixIcon: Icon(Icons.person, color: purpleColor),
                          contentPadding:
                              EdgeInsets.fromLTRB(0.0, 20, 0.0, 20.0),
                        ),
                        controller: emailController,
                        showCursor: true,
                        readOnly: true,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        obscureText: _obscured,
                        focusNode: textFieldFocusNode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle:
                              TextStyle(color: purpleColor, fontSize: 18),
                          fillColor: purpleColor_2,
                          filled: true,
                          prefixIcon: Icon(Icons.lock, color: purpleColor),
                          contentPadding:
                              const EdgeInsets.fromLTRB(0.0, 20, 0.0, 20.0),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                  _obscured
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  size: 24,
                                  color: purpleColor),
                            ),
                          ),
                        ),
                        controller: passwordController,
                        showCursor: true,
                        readOnly: true,
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailController.text == "lhkhanh@tma.com.vn"
                            && passwordController.text == "123456"
                            ) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyLayout()));
                            }
                          },
                          child: Text("LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white)),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(purpleColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
