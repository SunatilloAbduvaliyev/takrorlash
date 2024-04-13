import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takrorlash/screen/auth/register/widget/register_button.dart';
import '../../../utils/color/app_colors.dart';
import '../../../utils/style/app_text_style.dart';
import '../../route.dart';
import '../auth_view_model/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: context.watch<AuthViewModel>().loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(34, 27, 34, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/register.png'),
              const SizedBox(
                height: 29,
              ),
              Text(
                "Sign Up",
                style: AppTextStyle.interSemiBold.copyWith(
                    color: AppColors.white, fontSize: 22.5, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              RegisterTextField(
                controller: nameController,
                labelText: 'First Name',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 6,
              ),
              RegisterTextField(
                controller: usernameController,
                labelText: 'username',
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 6,
              ),
              RegisterTextField(
                controller: emailController,
                labelText: 'Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              RegisterTextField(
                controller: passwordController,
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 32,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.read<AuthViewModel>().registerUser(
                    context,
                    email: emailController.text,
                    password: passwordController.text,
                    username: usernameController.text,
                  );
                },
                child: Container(
                  width: 203,
                  height: 49,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: AppTextStyle.interSemiBold.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTextStyle.interRegular.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.loginRoute);
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyle.interRegular.copyWith(
                          color: AppColors.c1A72DD, fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
