import 'package:flutter/material.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'widgets/home_view_body.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   bool showFAB = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: showFAB
//           ? FloatingActionButton(
//               onPressed: () {},
//               child: const Icon(Icons.arrow_upward_rounded),
//             )
//           : null,
//       body: SafeArea(
//         child: NotificationListener<ScrollNotification>(
//           onNotification: (notification) {
//             setState(() {
//               if (notification.metrics.pixels > 200) {
//                 showFAB = true;
//               } else {
//                 showFAB = false;
//               }
//             });
//             return true;
//           },
//           child: HomeViewBody(),
//         ),
//       ),
//     );
//   }
// }
