import 'package:flutter/material.dart';
import 'package:session/core/app_colors.dart';
import 'package:session/core/app_strings.dart';
import 'package:session/presentation/features/home/view/home_screen.dart';
import 'package:session/presentation/widgets/app_button.dart';
import 'package:session/presentation/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            //
            Center(child: CircleAvatar(radius: 30, child: Icon(Icons.person, size: 40))),
            SizedBox(height: 15),
            //
            AppTextField(
              controller: emailController,
              onChange: (v) {
                setState(() {});
              },
              prefixIcon: Icon(Icons.email),
              hint: AppStrings.emailAddress,
              keyboardType: TextInputType.emailAddress,
            ),
            //
            AppTextField(
              controller: password,
              obscureText: isObsecure,
              hint: AppStrings.password,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                child: Icon(isObsecure ? Icons.visibility_off : Icons.visibility, size: 20, color: AppColors.grey),
              ),
              onChange: (v) {
                setState(() {});
              },
            ),

            //
            AppButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              title: AppStrings.login,
              height: 50,
            ),

            //
            TextButton(onPressed: () {}, child: Text(AppStrings.registerNewAccount, style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w700))),
          ],
        ),
      ),
    );
  }
}
