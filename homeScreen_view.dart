import 'package:flutter/material.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3B3B98), Color(0xFF6D83F2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Decorative Circles
            const PositionedCircle(top: -40, left: -40, diameter: 120),
            const PositionedCircle(top: 80, right: 50, diameter: 80),
            const PositionedCircle(bottom: 100, left: 30, diameter: 60),
            const PositionedCircle(bottom: 20, left: 100, diameter: 90),

            // Welcome Text
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Enter personal details to your\nemployee account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Buttons at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xFF3B3B98),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xFF3B3B98),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double diameter;

  const PositionedCircle({
    super.key,
    this.top = double.nan,
    this.bottom = double.nan,
    this.left = double.nan,
    this.right = double.nan,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top.isNaN ? null : top,
      bottom: bottom.isNaN ? null : bottom,
      left: left.isNaN ? null : left,
      right: right.isNaN ? null : right,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.white70, Color(0xFF3B3B98)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:toko_online/views/login_view.dart';
// import 'package:toko_online/views/register_user_view.dart';
// import 'package:toko_online/views/register_user_view.dart';

// void main() {
//   runApp(const Scaffold());
// }

// class HomescreenView extends StatelessWidget {
//   const HomescreenView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome UI',
//       debugShowCheckedModeBanner: false,
//       home: const WelcomeScreen(),
//     );
//   }
// }

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF3B3B98), Color(0xFF6D83F2)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Decorative Circles
//             const PositionedCircle(top: -40, left: -40, diameter: 120),
//             const PositionedCircle(top: 80, right: 50, diameter: 80),
//             const PositionedCircle(bottom: 100, left: 30, diameter: 60),
//             const PositionedCircle(bottom: 20, left: 100, diameter: 90),

//             // Welcome Text
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text(
//                     "Welcome Back!",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Enter personal details to your\nemployee account",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Buttons at bottom
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => const LoginView()),
//                         );
//                       },
//                       child:Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 8,horizontal: 20),
//                       child: const Text(
//                         "Sign in",
//                         style: TextStyle(
//                           color: Color(0xFF3B3B98), 
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16),
//                       ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (_) => const RegisterUserView()),
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 8, horizontal: 20),
//                         child: const Text(
//                           "Sign up",
//                           style: TextStyle(
//                             color: Color(0xFF3B3B98),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PositionedCircle extends StatelessWidget {
//   final double top;
//   final double bottom;
//   final double left;
//   final double right;
//   final double diameter;

//   const PositionedCircle({
//     super.key,
//     this.top = double.nan,
//     this.bottom = double.nan,
//     this.left = double.nan,
//     this.right = double.nan,
//     required this.diameter,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: top.isNaN ? null : top,
//       bottom: bottom.isNaN ? null : bottom,
//       left: left.isNaN ? null : left,
//       right: right.isNaN ? null : right,
//       child: Container(
//         width: diameter,
//         height: diameter,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: const LinearGradient(
//             colors: [Colors.white70, Color(0xFF3B3B98)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//       ),
//     );
//   }
// }
