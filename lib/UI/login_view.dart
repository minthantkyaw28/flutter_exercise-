import 'package:app_1/UI/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../storage/shared_preference_manager.dart';

class login_view extends StatefulWidget {
  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();

  @override
  Widget build(BuildContext context) {
    var _rememberMe = false;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 121, 176, 243),
                Color.fromARGB(255, 87, 147, 220),
                Color.fromARGB(255, 59, 128, 212),
                Color.fromARGB(255, 16, 104, 211),
              ],
              stops: [.1, .4, .7, .9],
            )),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    height: 130,
                    child: Image.network(
                      'https://th.bing.com/th/id/R.6c63c3fa80a5869538bad8a4cbd327c6?rik=QcMS%2bzbMELu5KA&pid=ImgRaw&r=0',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Color(0xFF6CA8F1),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60,
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.white),
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Color(0xFF6CA8F1),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60,
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15),
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(children: <Widget>[
                      Checkbox(
                          value: _rememberMe,
                          checkColor: Colors.green,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          }),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return drawer_menu();
                        })),
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        '- OR -',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign In With",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildSocialBtn(
                            () => print("Login with Facebook"),
                            const NetworkImage(
                                'https://th.bing.com/th/id/R.6c63c3fa80a5869538bad8a4cbd327c6?rik=QcMS%2bzbMELu5KA&pid=ImgRaw&r=0')),
                        _buildSocialBtn(
                            () => print("Login with Google"),
                            const NetworkImage(
                                'https://th.bing.com/th/id/R.6c63c3fa80a5869538bad8a4cbd327c6?rik=QcMS%2bzbMELu5KA&pid=ImgRaw&r=0')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void userDataValidate() async {
    String? email = await SharedPreferenceManager.readEmail(key: 'email');
    String? password = await SharedPreferenceManager.readPassword(key: 'pw');

    print(email);
    print(password);

    if (email == _emailController.text &&
        password == _passwordController.text) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return drawer_menu();
      }));
    } else {
      Fluttertoast.showToast(
        msg: "Check your email or password",
        backgroundColor: Color.fromARGB(255, 223, 207, 64),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}

Widget _buildSocialBtn(Function onTap, NetworkImage logo) {
  return GestureDetector(
    onTap: () {
      print("Login with social button");
    },
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6,
          )
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}
