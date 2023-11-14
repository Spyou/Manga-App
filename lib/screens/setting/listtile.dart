import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ExpansionListTile extends StatelessWidget {
  const ExpansionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
            collapsedIconColor: Colors.white,
            leading: const Icon(
              FluentIcons.paint_brush_20_filled,
              size: 30,
              color: Colors.amber,
            ),
            title: const Text(
              'Theme',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Change your theme',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            children: [
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  Icons.light_mode_rounded,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'Light Mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  Icons.dark_mode_rounded,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  FluentIcons.dark_theme_20_filled,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'System Mode',
                  style: TextStyle(color: Colors.white),
                ),
                trailing:
                    const Icon(Icons.check, size: 20, color: Colors.white),
              ),
            ]),
        const ListTile(
          leading: Icon(
            FluentIcons.settings_20_filled,
            size: 26,
            color: Colors.blueAccent,
          ),
          title: Text(
            'General',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'Customise according to your',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          trailing: Icon(
            Icons.navigate_next_rounded,
            color: Colors.white,
          ),
        ),
        ExpansionTile(
          collapsedIconColor: Colors.white,
          leading: Icon(
            FluentIcons.book_globe_20_filled,
            color: Colors.yellow.shade800,
            size: 26,
          ),
          title: const Text(
            'Manga Provider',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Change your manga provider',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 32, 32, 32),
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  collapsedIconColor: Colors.white,
                  title: const Text(
                    'MangaDex',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'MangaDex',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'MangaKakalot',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text(
                        'All Anime',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const ListTile(
          leading: Icon(
            FluentIcons.dual_screen_settings_20_filled,
            size: 26,
            color: Colors.cyanAccent,
          ),
          title: Text(
            'Reader Setting',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'Adjust your reading screen',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          trailing: Icon(
            Icons.navigate_next_rounded,
            color: Colors.white,
          ),
        ),
        ExpansionTile(
            collapsedIconColor: Colors.white,
            leading: Icon(
              FluentIcons.info_20_filled,
              size: 26,
              color: Colors.deepPurpleAccent.shade100,
            ),
            title: const Text(
              'About',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Nothing Here',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            children: [
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  FluentIcons.shifts_checkmark_20_filled,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'Check Version',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                trailing: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  FluentIcons.accessibility_20_filled,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'Developers',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: const Icon(
                  FluentIcons.book_information_20_filled,
                  size: 20,
                  color: Colors.white,
                ),
                title: const Text(
                  'Disclaimer',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                ),
              ),
            ]),
      ],
    );
  }
}
