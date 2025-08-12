import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          0.7 * _scrollController.position.maxScrollExtent) {
        context.read<NewestBooksCubit>().fetchMoreNewestBooks();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFAB
          ? FloatingActionButton(
              mini: true,
              tooltip: 'Back to top',
              onPressed: () {
                animateToBeginning();
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
          child: HomeViewBody(scrollController: _scrollController),
        ),
      ),
    );
  }

  void animateToBeginning() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
