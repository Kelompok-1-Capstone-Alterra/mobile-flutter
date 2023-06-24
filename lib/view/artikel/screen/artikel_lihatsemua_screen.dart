import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/artikel/widget/artikel_lihatsemua_widget.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_lastest_provider.dart';
import 'package:mobile_flutter/view_model/service_provider/get_article_trending_provider.dart';
import 'package:provider/provider.dart';

class ArtikelLihatSemuaScreen extends StatefulWidget {
  final String title;
  final bool latest;
  const ArtikelLihatSemuaScreen({
    super.key,
    required this.title,
    required this.latest,
  });

  @override
  State<ArtikelLihatSemuaScreen> createState() =>
      _ArtikelLihatSemuaScreenState();
}

class _ArtikelLihatSemuaScreenState extends State<ArtikelLihatSemuaScreen> {
  final double _horizontal = 16;

  Future<void> _refreshPage() async {
    context.read<GetTrendingArticleProvider>().getTrendingArticleData();
    context.read<GetArticleLatestProvider>().getArticleLatestData();
  }

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
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            ArtikelLihatSemuaWidget(
              horizontal: _horizontal,
              latest: widget.latest,
            ),
          ],
        ),
      ),
    );
  }
}
