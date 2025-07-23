import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pablo/controllers/auth_controller.dart';
import 'package:pablo/utils/app_textstyles.dart';
import 'package:pablo/views/main_screen.dart';
import 'package:pablo/views/signin_screen.dart';
import 'package:pablo/views/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
    SignUpScreen({super.key});

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();

    @override
    Widget build(BuildContext context) {

        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
            body: SafeArea(child: SingleChildScrollView(
                    padding: EdgeInsets.all(24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios), color: isDark ? Colors.white : Colors.black,),
                            SizedBox(height: 20,),
                            Text("Create Account", style: AppTextstyles.withColor(AppTextstyles.h1, Theme.of(context).textTheme.bodyLarge!.color!),),
                            SizedBox(height: 8,),

                            Text("Sign up to get started",
                                style: AppTextstyles.withColor(AppTextstyles.bodLarge, isDark ? Colors.grey[400]! : Colors.grey[600]!)),

                            SizedBox(height: 40,),

                            // full name text field
                            CustomTextfield(
                                label: "Full name",
                                prefixIcon: Icons.person_outline,
                                keyboardType: TextInputType.name,
                                controller: _nameController,
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return "Please enter your full name";
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 16,),

                            CustomTextfield(
                                label: "Email",
                                prefixIcon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return "Please enter your email";
                                    }
                                    if (!GetUtils.isEmail(value)) {
                                        return "Please enter a valid email";
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 16,),

                            // password field
                            CustomTextfield(
                                label: "Password",
                                prefixIcon: Icons.lock_outlined,
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                                controller: _passwordController,
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return "Please enter your password";
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 8,),

                            // confirm password field
                            CustomTextfield(
                                label: "Confirm password",
                                prefixIcon: Icons.lock_outlined,
                                keyboardType: TextInputType.visiblePassword,
                                isPassword: true,
                                controller: _confirmPasswordController,
                                validator: (value) {
                                    if (value == null || value.isEmpty) {
                                        return "Please confirm your password";
                                    }
                                    if (value != _passwordController.text) {
                                        return "Passwords do not match";
                                    }
                                    return null;
                                },
                            ),
                            const SizedBox(height: 24,),

                            // sign in button
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: _handleSignUp,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        padding: EdgeInsets.symmetric(vertical: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12)
                                        )
                                    ),
                                    child: Text("Sign Up", style: AppTextstyles.withColor(AppTextstyles.buttonMedium, Colors.white),)),
                            ),

                            const SizedBox(height: 24,),

                            // sign up section
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Text("Already have an account ?", style: AppTextstyles.withColor(AppTextstyles.bodMedium, isDark ? Colors.grey[400]! : Colors.grey[600]!),),
                                    TextButton(onPressed: () => Get.to(SigninScreen()), child: Text("Sign In", style: AppTextstyles.withColor(AppTextstyles.buttonMedium, Theme.of(context).primaryColor),))
                                ],
                            ),
                        ],
                    ),
                )),
        );
    }
}

void _handleSignUp() {
    final AuthController authController = Get.find<AuthController>();
    Get.to(() => const MainScreen());

}
