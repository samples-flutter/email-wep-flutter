import 'package:flutter/material.dart';
import 'package:web_flutter/components/side_menu.dart';
import 'package:web_flutter/feature/email/email_screen.dart';
import 'package:web_flutter/feature/responsive.dart';
import 'package:web_flutter/models/email.dart';
import 'package:web_flutter/repository/post_repository.dart';

import 'components/list_of_emails.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final repository = PostRepository();

  @override
  void initState() {
    repository.getPost();
    super.initState();
  }

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
              child: FutureBuilder<List<Email>>(
                future: repository.getPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return ListOfEmails(emails: snapshot.data!);
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: const EmailScreen(),
            ),
          ],
        ),
        tablet: Row(
          children: [
            Expanded(
              flex: 3,
              child: FutureBuilder<List<Email>>(
                future: repository.getPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return ListOfEmails(emails: snapshot.data!);
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              ),
            ),
            const Expanded(
              flex: 6,
              child: EmailScreen(),
            ),
          ],
        ),
        mobile: FutureBuilder<List<Email>>(
          future: repository.getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 80,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return ListOfEmails(emails: snapshot.data!);
              } else {
                return const Text('Empty data');
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          },
        ),
      ),
    );
  }
}
