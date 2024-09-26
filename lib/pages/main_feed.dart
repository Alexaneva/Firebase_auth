import 'package:firebase_auth_newsApp/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_services.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  State<MainFeed> createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        label: 'Log out',
        onPressed: () {
          AuthService.logout();
          GoRouter.of(context).pushReplacement('/auth');
        },
      ),
    );
  }
}
