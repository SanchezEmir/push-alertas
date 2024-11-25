import 'dart:async';

import 'package:alerta_push_app/utils/app_colors.dart';
import 'package:alerta_push_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alerta_push_app/widgets/material_buttom_widget.dart';
import 'package:alerta_push_app/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NotificationsBloc _notificationsBloc;
  String? _token;
  // Timer? _soundTimer;
// dAfmZ1xTSvSdbl7JifhcR8:APA91bHlXcPMYIsSkB0IE_7Fc_gPbBXOVByl5c1SS1wBxKg1FVeXlpFBbnQZ_XEJaBElnEU2KTwCJmscjWL-SlAe_3Y_wix2OL8QvJztMFfmGNRKyqktyWc

  @override
  void initState() {
    super.initState();
    _notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    _getFCMToken();
  }

  // @override
  // void dispose() {
  //   _stopSound();
  //   super.dispose();
  // }

  void _getFCMToken() async {
    final token = await _notificationsBloc.messaging.getToken();
    setState(() {
      _token = token;
    });
  }

  // void _startSound() {
  //   _soundTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
  //     print("Reproduciendo sonido");
  //     // mostrarNotification("", "");
  //   });
  // }

  // void _stopSound() {
  //   _soundTimer?.cancel();
  //   _soundTimer = null;
  // }

  void _copyToken() {
    if (_token != null) {
      Clipboard.setData(ClipboardData(text: _token!));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Token copiado"),
        ),
      );
    }
  }

  void _stopSound() {
    _notificationsBloc.stopSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "Inicio", color: Colors.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButtomWidget(
                text: "Generar Token",
                onPressed: _getFCMToken,
              ),
              const SizedBox(height: 20),
              TextWidget(
                fontSize: 12,
                text: _token ?? "Token no generado",
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              MaterialButtomWidget(
                text: "Copiar Token",
                onPressed: _copyToken,
              ),
              const SizedBox(height: 20),
              MaterialButtomWidget(
                text: "DETENER",
                onPressed: _stopSound,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late final NotificationsBloc _notificationsBloc;
//   String? _token;
//   var _soundTimer;

//   late AnimationController _controller;
//   late Animation<double> _animation;
//   var tok;

//   @override
//   void initState() {
//     super.initState();
//     _notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
//     _initilizaleEscuchaNotificacion();
//     _getFCMToken();
//     _startSound();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     _animation = Tween<double>(begin: 200, end: 300)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   void _initilizaleEscuchaNotificacion() {
//     starRepeatSound();
//     _startAnimation();
//   }

//   void _getFCMToken() async {
//     final token = await _notificationsBloc.messaging.getToken();
//     setState(() {
//       _token = token;
//     });
//   }

//   void _startSound() {
//     _soundTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       print("Reproduciendo sonido");
//       // mostrarNotification("", "");
//     });
//   }

//   void _stopSound() {
//     _soundTimer?.cancel();
//     _soundTimer = null;
//   }

//   Timer? _notificationesTimer;

//   void starRepeatSound() {
//     _notificationesTimer = Timer.periodic(Duration(seconds: 2), (timer) {
//       print("Reproduciendo sonido");
//       // mostrarNotification("", "");
//     });
//   }

//   void stopSound() {
//     _notificationesTimer?.cancel();
//     _notificationesTimer = null;
//     _stopAnimation();
//   }

//   void _startAnimation() {
//     _controller.repeat(reverse: true);
//   }

//   //stop animation
//   void _stopAnimation() {
//     _controller.stop();
//   }

//   @override
//   void dispose() {
//     _stopSound();
//     super.dispose();
//   }

//   //copiar el token
//   void copyToken() {
//     if (tok != null) {
//       Clipboard.setData(ClipboardData(text: tok!));
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Token copiado"),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextWidget(text: "Inicio", color: AppColors.black),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: CircleAvatar(
//               child: Image.asset("assets/images/avatar.png"),
//             ),
//           )
//         ],
//       ),
//       drawer: Drawer(),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               MaterialButtomWidget(
//                   text: "Generar Token", onPressed: _getFCMToken),
//               SizedBox(height: 20),
//               //mostrar el token generado
//               TextWidget(
//                 fontSize: 12,
//                 text: tok ?? "Token no generado",
//                 color: AppColors.black,
//               ),
//               SizedBox(height: 20),
//               MaterialButtomWidget(
//                 text: "Copiar Token",
//                 onPressed: () {
//                   if (_token != null) {
//                     Clipboard.setData(ClipboardData(text: _token!));
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Token copiado"),
//                       ),
//                     );
//                   }
//                 },
//               ),
//               SizedBox(height: 20),
//               InkWell(
//                 // borderRadius: BorderRadius.circular(100),
//                 // splashColor: Colors.red,
//                 // customBorder: RoundedRectangleBorder(
//                 //   borderRadius: BorderRadius.circular(80),
//                 // ),
//                 onTap: () {
//                   stopSound();
//                 },
//                 child: AnimatedBuilder(
//                   animation: _animation,
//                   builder: (context, child) => Container(
//                     height: _animation.value,
//                     width: _animation.value,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.orange,
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: TextWidget(
//                           text: "DETENER",
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: Padding(
//       //   padding: const EdgeInsets.only(bottom: 30),
//       //   child: FloatingActionButton(
//       //     shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(100),
//       //     ),
//       //     onPressed: () {
//       //       Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //         return PruebaNoti();
//       //       }));
//       //     },
//       //     child: Icon(
//       //       Icons.add,
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
