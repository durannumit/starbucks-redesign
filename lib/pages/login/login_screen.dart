import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/utils/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isObscure = true;

  @override
  void initState() {
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/login_background.svg',
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  20.0, MediaQuery.of(context).size.height * 0.2, 20.0, 20.0),
              child: body(),
            )
          ],
        ),
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
            style: TextStyle(
                color: AppColors.dark,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit sed do eiusmod tempor",
            style: TextStyle(
                color: AppColors.dark,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextField(
            controller: _passwordController,
            obscureText: isObscure,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: SvgPicture.asset(
                  'assets/icon/password_suffix_icon.svg',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.075),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot your password?",
              style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.mainGreen),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(color: AppColors.mainGreen),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.order);
              },
              child: const Center(
                  child: Text(
                'Login',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              )),
            ),
          ),
        )
      ],
    );
  }
}
