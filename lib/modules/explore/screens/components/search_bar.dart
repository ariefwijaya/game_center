import 'package:flutter/material.dart';
import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';
import 'package:game_center/widgets/design_system/design_system.dart';

class SearchBar extends StatelessWidget {
  final String? placeholder;
  final VoidCallback? onTap;
  const SearchBar({Key? key, this.placeholder, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.search_rounded,
                    color: Theme.of(context).disabledColor),
                const SizedBox(width: 15),
                Expanded(
                    child: TypographyCustom.subheading.medium(placeholder ?? "",
                        color: Theme.of(context).disabledColor))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
