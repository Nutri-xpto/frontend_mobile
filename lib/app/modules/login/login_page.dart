import 'package:flutter_modular/flutter_modular.dart';
import 'package:mydiet/app/modules/home/home_page.dart';
import 'package:mydiet/app/modules/login/components/TextFieldContainer.dart';
import 'package:mydiet/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:mydiet/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/image-login.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/logo.png',
            ),
            TextFieldContainer(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (onSaved) {},
                cursorColor: primaryColorStrong,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: primaryColorStrong,
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(color: primaryColorStrong),
                    border: InputBorder.none),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                onChanged: (onSaved) {},
                cursorColor: primaryColorStrong,
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: primaryColorStrong,
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: primaryColorStrong,
                    ),
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: primaryColorStrong),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: primaryColorStrong),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                    fontSize: 17,
                    color: primaryColorStrong,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                'Entre em contato com o seu nutricionista',
                style: TextStyle(
                  fontSize: 17,
                  color: primaryColorStrong,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
