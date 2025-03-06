import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showFAB = false;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Get.put(_scrollController);
    return Scaffold(
      floatingActionButton: showFAB
          ? FloatingActionButton(
              mini: true,
              onPressed: () {
                _scrollController.animateTo(
                  0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            setState(() {
              if (notification.metrics.pixels > 200) {
                showFAB = true;
              } else {
                showFAB = false;
              }
            });
            return true;
          },
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
