import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/view/tanamanku/screen/detail_tanaman_screen.dart';

class TanamankuScreen extends StatelessWidget {
  const TanamankuScreen({super.key});

  final isEmpty = false;
  //tambah line satu
  final double horizontal = 20;
  final double vertical = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tanamanku',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FluentIcons.delete_16_regular,
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Total Tanaman : ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(isEmpty ? '0' : '8',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              isEmpty
                  ? Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/empty_tanaman.svg',
                              width: 200,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Sepertinya kamu belum memiliki',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: neutral[50],
                                  ),
                            ),
                            Text(
                              'tanaman',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: neutral[50],
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        TextField(
                          enabled: false,
                          maxLength: 30,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              FluentIcons.search_16_regular,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Cari Tanamanku',
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: neutral,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailTanamanScreen(),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/sample_tomat.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tomat',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Text(
                                            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color: neutral[40],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
