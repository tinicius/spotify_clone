import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SettingsItem extends StatefulWidget {
  const SettingsItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.isOnOff = false,
      this.onTap})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool isOnOff;
  final VoidCallback? onTap;

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        trailing: widget.isOnOff
            ? InkWell(
                onTap: () {
                  isOn = !isOn;
                  setState(() {});
                },
                child: Icon(
                  Icons.circle,
                  color: isOn ? ThemeConfig.green : ThemeConfig.grey,
                ),
              )
            : const SizedBox(),
        title:
            Text(widget.title, style: ThemeConfig().getTextStyle(fontSize: 12)),
        subtitle: Text(widget.subtitle,
            style: ThemeConfig()
                .getTextStyle(fontSize: 10, fontColor: ThemeConfig.grey)),
      ),
    );
  }
}
