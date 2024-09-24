

import 'package:firebase_auth_newsApp/pages/widgets/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseTemplate extends StatefulWidget {
  final Widget child;

  const BaseTemplate({super.key, required this.child});

  @override
  State<BaseTemplate> createState() => _BaseTemplateState();
}

class _BaseTemplateState extends State<BaseTemplate> {
  late StatusBar statusBar;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusBar = Provider.of<StatusBar>(context, listen: false);
      statusBar.showStatusBar(); //
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        statusBar.hideStatusBar();
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBar = Provider.of<StatusBar>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            if (statusBar.isStatusBarVisible) {
              statusBar.hideStatusBar();
            } else {
              statusBar.showStatusBar();
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: statusBar.isStatusBarVisible
                ? const Icon(
              Icons.toggle_on,
              color: Colors.white54,
              size: 30,
            )
                : const Icon(
              Icons.toggle_off,
              color: Colors.black54,
              size: 30,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.child,
      ),
    );
  }
}