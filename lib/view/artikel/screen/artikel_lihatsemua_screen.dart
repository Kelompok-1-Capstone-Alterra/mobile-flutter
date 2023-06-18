import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/artikel/widget/artikel_lihatsemua_widget.dart';

class ArtikelLihatSemuaScreen extends StatefulWidget {
  final String title;
  const ArtikelLihatSemuaScreen({super.key, required this.title});

  @override
  State<ArtikelLihatSemuaScreen> createState() =>
      _ArtikelLihatSemuaScreenState();
}

class _ArtikelLihatSemuaScreenState extends State<ArtikelLihatSemuaScreen> {
  final double _horizontal = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget.title,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 22),
          minFontSize: 18,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 10),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(FluentIcons.chevron_left_16_regular),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          ArtikelLihatSemuaWidget(
            horizontal: _horizontal,
          ),
        ],
      ),
    );
  }
}
