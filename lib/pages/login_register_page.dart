import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    String selectedRole = 'user'; // Varsayılan olarak "user" rolü

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Text(
                controller.isLogin.value ? "Welcome Back!" : "Create Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.isLogin.value
                    ? "Please sign in to continue"
                    : "Register to get started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple.shade400,
                ),
              ),
              const SizedBox(height: 30),
              // Email Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Role Selection (Dropdown)
              if (!controller.isLogin.value) // Only show for registration
                DropdownButton<String>(
                  value: selectedRole,
                  onChanged: (String? newValue) {
                    selectedRole = newValue!;
                  },
                  items: <String>['user', 'organizer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 10),
              // Error Message
              Obx(
                () => controller.errorMessage!.value != null
                    ? Text(
                        controller.errorMessage!.value,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 20),
              // Login/Register Button
              ElevatedButton(
                onPressed: () {
                  if (controller.isLogin.value) {
                    controller.signIn(
                      emailController.text,
                      passwordController.text,
                    );
                  } else {
                    controller.createUser(
                      emailController.text,
                      passwordController.text,
                      selectedRole, // Role parametresi ile kullanıcı kaydı
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  controller.isLogin.value ? "Login" : "Register",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              // Toggle Login/Register
              GestureDetector(
                onTap: () {
                  controller.toggleLogin();
                },
                child: Text(
                  controller.isLogin.value
                      ? "Don't have an account? Register here."
                      : "Already have an account? Login here.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple.shade400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
