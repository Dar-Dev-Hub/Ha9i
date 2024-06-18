import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ha9i/controllers/login_contoller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SvgPicture.asset(
                  'assets/logo/dardev_logo.svg',
                  width: 200,
                  height: 100,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 16),
                const Text('Please login to access and start legal'),
                const SizedBox(height: 32),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(hintText: 'Enter your email'),
                        validator: controller.emailValidator,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 12),
                      Obx(() => TextFormField(
                            obscureText: controller.obscureText.value,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: IconButton(
                                icon: Icon(controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: controller.toggleObscureText,
                              ),
                            ),
                            validator: controller.passwordValidator,
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Implement forgot password
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Color.fromARGB(255, 242, 74, 74)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(color: Color.fromARGB(255, 242, 74, 74)),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
