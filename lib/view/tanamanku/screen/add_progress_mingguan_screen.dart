import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class AddProgressMingguanScreen extends StatelessWidget {
  const AddProgressMingguanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Progres Mingguan',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              FluentIcons.chevron_left_16_regular,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1 - 7 May 2023',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Kesehatan Tanaman Kamu',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Bagaimana kesehatan tanaman kamu saat ini?',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) {
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: neutral[40],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primary,
                                ),
                              ),
                              child: Icon(
                                FluentIcons.drop_12_filled,
                                color: neutral[10],
                              ),
                            ),
                            Text(
                              'Sangat buruk',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: primary[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Progres Tanamanmu',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: neutral[10],
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLines: 4,
                        maxLength: 100,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: neutral[10],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Masukkan deskripsi progres tanaman kamu',
                          hintStyle: ThemeData().textTheme.bodyMedium!.copyWith(
                                color: neutral[50],
                                fontWeight: FontWeight.w400,
                              ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
