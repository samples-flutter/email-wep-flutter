import 'package:flutter/material.dart';
import 'package:web_flutter/components/side_menu.dart';
import 'package:web_flutter/feature/email/email_screen.dart';
import 'package:web_flutter/feature/responsive.dart';

import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: const SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: const ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: const EmailScreen(),
            ),
          ],
        ),
        tablet: Row(
          children: const [
            Expanded(
              flex: 3,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: 6,
              child: EmailScreen(),
            ),
          ],
        ),
        mobile: const ListOfEmails(),
      ),
    );
  }
}
