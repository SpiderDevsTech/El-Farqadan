import 'package:elfarqadan_app/app/components/coming_soon_screen.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:elfarqadan_app/app/views/orbital/views/advanced_screen.dart';
import 'package:elfarqadan_app/app/views/orbital/views/vectors_screen.dart';
import 'package:flutter/material.dart';

import '../../config/helpers/assets_manager.dart';
import '../../models/sub_subject_model.dart';
import '../../models/subject_model.dart';
import '../../components/subtopic_tile.dart';

class OrbitalScreen extends StatefulWidget {
  const OrbitalScreen({super.key});

  @override
  State<OrbitalScreen> createState() => _OrbitalScreenState();
}

class _OrbitalScreenState extends State<OrbitalScreen> {
  final Subject subject = Subject(
    name: "Orbital Mechanics",
    icon: AssetsManager.orbital,
    screen: const OrbitalScreen(),
    isAvailable: true,
    subSubjects: [
      SubSubject(
        name: "Vectors",
        screen: const VectorsScreen(),
        isAvailable: true,
      ),
      SubSubject(
        name: "Advanced Calculations",
        screen: const AdvancedScreen(),
        isAvailable: true,
      ),
      SubSubject(
        name: "Subject Materials",
        screen: const SizedBox(),
        isAvailable: false,
      ),
      SubSubject(
        name: "Projects",
        screen: const SizedBox(),
        isAvailable: false,
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: context.height * 0.1,
        title: Row(
          children: [
            Image.asset(
              subject.icon,
              width: context.width * 0.2,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(subject.name),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                child: Text(
                  "- What's it?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "Orbital Mechanics or Astrodynamics is the application of Ballistics and Celestial Mechanics to the practical problems concerning the motion of rockets and other spacecrafts.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Now, let's play\nwith some basics :\")",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SubTopicTile(
              title: subject.subSubjects[0].name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => subject.subSubjects[0].screen,
                  ),
                );
              },
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Great Job!\nLet's advance more!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SubTopicTile(
              title: subject.subSubjects[1].name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => subject.subSubjects[1].screen,
                  ),
                );
              },
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Let's see some materials!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SubTopicTile(
              title: subject.subSubjects[2].name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => subject.subSubjects[2].isAvailable
                        ? subject.subSubjects[2].screen
                        : const ComingSoonScreen(),
                  ),
                );
              },
            ),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Let's see our own projects",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SubTopicTile(
              title: subject.subSubjects[3].name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => subject.subSubjects[3].isAvailable
                        ? subject.subSubjects[3].screen
                        : const ComingSoonScreen(),
                  ),
                );
              },
            ),
            const Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Now, let's talk a moment to adore\nthe work done here by our great \nDean: Prof. Osama M. Shalabia",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(AssetsManager.profOsama),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: const [
                  Text(
                    "This elaborate work would not have come to light except under the guidance of a great man. We all extend our thanks, appreciation and gratitude on behalf of ourselves and on behalf of everyone who is passionate about astronomy and space sciences to Professor Osama M. Shalabia, Leader & Dean of faculty of Navigation Sciences and Space Technology.",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Thank you, Our leader. Thank you, Prof. Osama",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
