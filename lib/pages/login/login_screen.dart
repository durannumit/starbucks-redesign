import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/utils/device/device_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/login_background.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, MediaQuery.of(context).size.height * 0.2, 20.0, 20.0),
            child: body(),
          )
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/images/starbucks_name.svg',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            "Welcome Back!",
            style: TextStyle(color: AppColors.dark, fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit sed do eiusmod tempor",
            style: TextStyle(color: AppColors.dark, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: TextField(
            controller: _emailController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: _emailController.clear,
                icon: SvgPicture.asset(
                  'assets/icon/password_suffix_icon.svg',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
