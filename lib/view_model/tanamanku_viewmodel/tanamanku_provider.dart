import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/overview_section.dart';
import 'package:mobile_flutter/view/tanamanku/widgets/progress_section.dart';

class TanamankuProvider with ChangeNotifier {
  int selectedIndex = 0;

  bool fullDescription = false;

  final List<Widget> pages = [
    const OverviewSection(),
    const ProgressSection(),
  ];

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void showFullDescription() {
    fullDescription = true;
    // fullDescription = !fullDescription;
    notifyListeners();
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}