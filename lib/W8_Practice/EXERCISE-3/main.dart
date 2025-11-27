import 'package:flutter/material.dart';

import 'package:w4_app/W8_Practice/EXERCISE-3/ui/screens/profile.dart';
import 'package:w4_app/W8_Practice/EXERCISE-3/data/profile_data.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profileData: ronanProfile),
  ));
}
