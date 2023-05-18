import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class TanamankuScreen extends StatelessWidget {
  const TanamankuScreen({super.key});

  final isEmptry = true;

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  Text('4', style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tomat',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: neutral[40],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              // SizedBox(
              //   height: 172,
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Card(
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       color: neutral[10],
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //             width: 150,
              //             height: 100,
              //             child: Image.asset(
              //               'assets/images/sample_tomat.png',
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.symmetric(
              //               vertical: 10,
              //               horizontal: 5,
              //             ),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   'Title',
              //                   style: Theme.of(context).textTheme.titleSmall,
              //                 ),
              //                 Text(
              //                   'Subtitle',
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .labelSmall!
              //                       .copyWith(color: neutral[40]),
              //                 ),
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
