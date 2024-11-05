import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/colors/colors.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              color: kBlackColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: kWhiteColor,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'My Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: kWhiteColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'myname@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: kWhiteColor),
                      ),
                      Text(
                        '07XXXXXXXX',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: kWhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.settings_outlined,
                      color: kBlackColor,
                    ),
                    title: Text(
                      'Kontoinstallningar',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kBlackColor),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: SvgPicture.asset(
                      'assets/svgs/mina_svg.svg',
                      width: 20.0,
                    ),
                    title: Text(
                      'Mina betalmetoder',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kBlackColor),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: SvgPicture.asset(
                      'assets/svgs/support_svg.svg',
                      width: 20.0,
                    ),
                    title: Text(
                      'Support',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kBlackColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
