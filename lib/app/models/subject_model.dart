import 'package:flutter/material.dart';

import 'sub_subject_model.dart';

class Subject {
  final String name;
  final String icon;
  final Widget screen;
  final bool isAvailable;
  final List<SubSubject> subSubjects;
  Subject({
    required this.name,
    required this.icon,
    required this.screen,
    this.isAvailable = false,
    this.subSubjects = const <SubSubject>[],
  });
}
