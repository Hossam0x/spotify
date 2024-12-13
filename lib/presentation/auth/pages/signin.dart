import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          children: [
            _signinText(),
            const SizedBox(
              height: 50,
            ),
            _EmailField(context),
            const SizedBox(
              height: 20,
            ),
            _PasswordField(context),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () {},
              title: "Sign In",
            ),
            const SizedBox(
              height: 20,
            ),
            _devider(context)
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sing In',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _EmailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _PasswordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a Member ?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  SignupPage()));
            },
            child: const Text("Register Now"),
          )
        ],
      ),
    );
  }

  Widget _devider(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          height: 10,
        )), // الـ Divider
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        Expanded(child: Divider()), // الـ Divider
      ],
    );
  }
}
