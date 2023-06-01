import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/utils/themes/custom_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(primary.withOpacity(0.1))),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            color: Colors.black,
            FluentIcons.ios_arrow_ltr_24_filled,
          ),
        ),
        title: AutoSizeText(
          "Notifikasi",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        children: const [
          NotficationListTileWidget(
              plantTitle: "Tomat", description: "Kamu melupakan penyiraman"),
          NotficationListTileWidget(
              plantTitle: "wortel", description: "Kamu melupakan penyiraman"),
        ],
      ),
    );
  }
}

class NotficationListTileWidget extends StatelessWidget {
  const NotficationListTileWidget({
    super.key,
    required this.plantTitle,
    required this.description,
  });

  final String plantTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: LinearBorder.bottom(side: const BorderSide(color: Colors.black26)),
      onTap: () {},
      splashColor: primary[400]!.withOpacity(0.15),
      tileColor: primary[100],
      leading: CircleAvatar(
        backgroundColor: primary[200],
        child: AutoSizeText(
          plantTitle[0].toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      title: AutoSizeText(
        plantTitle,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: AutoSizeText(
        description,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: neutral[50]),
      ),
    );
  }
}
