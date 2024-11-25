import 'package:alerta_push_app/presentation/screens/home_screen.dart';
import 'package:alerta_push_app/presentation/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:alerta_push_app/utils/app_colors.dart';

class InicioPage extends StatefulWidget {
  //final UserModel userData;
  const InicioPage({
    super.key,
  });

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int _currentPage = 0;
  //UserModel? userDatos;

  @override
  void initState() {
    super.initState();
    //_getUserData();
  }

  // void _getUserData() {
  //   final user = widget.userData.id;
  //   final userRef = FirebaseFirestore.instance.collection('users').doc(user);
  //   userRef.snapshots().listen((event) {
  //     setState(() {
  //       userDatos = UserModel.fromFirebase(event.data()!);
  //     });
  //   });
  // }
// dAfmZ1xTSvSdbl7JifhcR8:APA91bHlXcPMYIsSkB0IE_7Fc_gPbBXOVByl5c1SS1wBxKg1FVeXlpFBbnQZ_XEJaBElnEU2KTwCJmscjWL-SlAe_3Y_wix2OL8QvJztMFfmGNRKyqktyWc
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      // NewPage(),
      // AnularPage(),
      // AprobadosPage(),
      NotificationsScreen(),
    ];

    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.green,
        currentIndex: _currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.cases_rounded), label: "Nuevo"),
          // BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Anular"),
          // BottomNavigationBarItem(icon: Icon(Icons.check), label: "Aprobados"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check), label: "Notificaciones"),
        ],
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
      ),
    );
  }
}
