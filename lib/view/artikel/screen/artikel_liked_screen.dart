import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/view/artikel/widget/artikel_liked_widget.dart';
import 'package:mobile_flutter/view_model/artikel_viewmodel/get_article_liked_provider.dart';
import 'package:provider/provider.dart';

class ArtikelLikedScreen extends StatefulWidget {
  const ArtikelLikedScreen({
    super.key,
  });

  @override
  State<ArtikelLikedScreen> createState() => _ArtikelLikedScreenState();
}

class _ArtikelLikedScreenState extends State<ArtikelLikedScreen> {
  final double _horizontal = 16;
  Future<void> _refreshPage() async {
    context.read<GetArticleLikedProvider>().getArticleLikedtData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Artikel yang disukai',
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
            ArtikelLikedWidget(
              horizontal: _horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
