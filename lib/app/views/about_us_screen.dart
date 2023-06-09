import 'package:elfarqadan_app/app/config/constants.dart';
import 'package:elfarqadan_app/app/config/helpers/assets_manager.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTeamScreen extends StatefulWidget {
  const AboutTeamScreen({super.key});

  @override
  State<AboutTeamScreen> createState() => _AboutTeamScreenState();
}

class _AboutTeamScreenState extends State<AboutTeamScreen> {
  Future<void> launchIntent(bool isPhone) async {
    final Uri phoneURI = Uri.parse("tel:${Constants().teamPhone}");
    final Uri mailURI = Uri.parse("mailto:${Constants().teamMail}");
    if (!await launchUrl(isPhone ? phoneURI : mailURI)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.topPadding + 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: Offset(-10, 10),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: context.width * 0.2,
                      backgroundImage: const AssetImage(
                        AssetsManager.logo,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: context.width * 0.2,
                      backgroundImage: const AssetImage(
                        AssetsManager.nsst,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.035,
            ),
            const Text(
              "Al Farqadan | الفرقدان",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: context.height * 0.015,
            ),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "- Vision",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).add(
                const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                Constants().vision,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "- Goal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).add(
                const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                Constants().goal,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: context.height * 0.015,
            ),
            const Text(
              "Our Members",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 32,
              ),
              itemBuilder: (_, index) {
                String member = Constants().members[index];
                return Align(
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: index == 1
                          ? 32.0
                          : index == 0 || index == 2
                              ? 8
                              : 0,
                    ),
                    child: Text(
                      member,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
              itemCount: Constants().members.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
            ),

            // SizedBox(
            //   height: context.height * 0.015,
            // ),
            const Text(
              "How to reach out?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline),
              minLeadingWidth: 20,
              title: Text(
                Constants().teamMail,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                onPressed: () async => await launchIntent(false),
                icon: const Icon(
                  Icons.message,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.smartphone),
              title: Text(Constants().teamPhone),
              trailing: IconButton(
                onPressed: () async => await launchIntent(true),
                icon: const Icon(
                  Icons.call,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
