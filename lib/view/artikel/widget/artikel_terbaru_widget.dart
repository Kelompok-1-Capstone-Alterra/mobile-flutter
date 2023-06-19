import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/widget/artikel_card/artikel_card_widget.dart';
import 'package:mobile_flutter/view/artikel/screen/detail_artikel.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ArtikelTerbaruWidget extends StatelessWidget {
  const ArtikelTerbaruWidget({
    super.key,
    required double horizontal,
  }) : _horizontal = horizontal;

  final double _horizontal;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: _horizontal,
      ),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => Stack(
        children: [
          const ArtikelCardWidget(
              title: "Perubahan cuaca ekstream, pastikan tanaman tetap sehat",
              time: "1",
              image:
                  "https://imtpi.or.id/wp-content/uploads/2016/09/post8.jpg"),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: const DetailArtikelScreen(),
                    withNavBar: false,
                  );
                },
              ),
            ),
          )
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
