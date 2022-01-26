import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';

class ListSettings extends StatefulWidget {
  const ListSettings({Key? key, required this.filter, required this.onPressed})
      : super(key: key);

  final String filter;
  final VoidCallback onPressed;

  @override
  State<ListSettings> createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettings> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.swap_vert, color: Colors.white, size: 15),
                const SizedBox(width: 5),
                Text(widget.filter, style: ThemeConfig().getTextStyle()),
              ],
            ),
          ),
          Obx(
            () {
              return controller.isList.value
                  ? InkWell(
                      onTap: () {
                        controller.isList.value = !controller.isList.value;
                      },
                      child: const Icon(Icons.list_outlined,
                          color: Colors.white, size: 25),
                    )
                  : InkWell(
                      onTap: () {
                        controller.isList.value = !controller.isList.value;
                      },
                      child: const Icon(Icons.grid_view_outlined,
                          color: Colors.white, size: 25),
                    );
            },
          ),
        ],
      ),
    );
  }
}
