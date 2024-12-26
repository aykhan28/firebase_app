import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';
import '../pages/organizer_page.dart';  // Organizatör sayfasına yönlendirme
import '../pages/user_page.dart';  // Kullanıcı sayfasına yönlendirme

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxString? errorMessage = RxString(null!);
  final RxBool isLogin = true.obs;
  RxString userRole = ''.obs; // Kullanıcının rolü

  Future<void> createUser(String email, String password, String role) async {
    try {
      await _authService.createUser(email: email, password: password, role: role);
      errorMessage!.value = null!;
    } catch (e) {
      errorMessage!.value = e.toString();
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _authService.signIn(email: email, password: password);
      await _getUserRole(); // Rolü al
      errorMessage!.value = null!;
      
      // Rol kontrolü yaparak uygun sayfaya yönlendiriyoruz
      if (userRole.value == 'organizer') {
        Get.offAll(() => OrganizerPage()); // Organizatör sayfasına yönlendir
      } else {
        Get.offAll(() => UserPage()); // Kullanıcı sayfasına yönlendir
      }

    } catch (e) {
      errorMessage!.value = e.toString();
    }
  }

  // Kullanıcının rolünü Firestore'dan al
  Future<void> _getUserRole() async {
    if (_authService.currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(_authService.currentUser!.uid).get();
      userRole.value = userDoc['role'] ?? ''; // Rol bilgisini al
    }
  }

  void toggleLogin() {
    isLogin.value = !isLogin.value;
  }
}
