import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:ugnet/helpers/theme_info.dart';
// import 'package:ugnet/pages/booking/booking.dart';
import 'package:ugnet/pages/chats/chatspage.dart';
import 'package:ugnet/pages/home/home.dart';
import 'package:ugnet/pages/map/themap.dart';
import 'package:ugnet/pages/notifications/notifications.dart';
import 'package:ugnet/pages/suggestion/suggest.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: HiddenDrawerMenu(          
          disableAppBarDefault: true,
          slidePercent: 70,
          screens: [
            ScreenHiddenDrawer(
                ItemHiddenMenu(
                    name: "Home",
                    colorLineSelected: Colors.grey,
                    baseStyle: ThemeInfo().bodyMTextStyle,
                    // baseStyle: ThemeInfo().lightTheme.data.textTheme.titleMedium,
                    selectedStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.0)),
                Home()),
            ScreenHiddenDrawer(
                ItemHiddenMenu(
                    name: "Chats",
                    colorLineSelected: Colors.grey,
                    baseStyle: ThemeInfo().bodyMTextStyle,
                    selectedStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.0)),
                const ChatPage()),
            ScreenHiddenDrawer(
                ItemHiddenMenu(
                    name: "Map",
                    colorLineSelected: Colors.grey,
                    baseStyle: ThemeInfo().bodyMTextStyle,
                    selectedStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.0)),
                const TheMap()),
            ScreenHiddenDrawer(
                ItemHiddenMenu(
                    name: "Notification",
                    colorLineSelected: Colors.grey,
                    baseStyle: ThemeInfo().bodyMTextStyle,
                    selectedStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.0)),
                const Notifications()),
            // ScreenHiddenDrawer(
            //     ItemHiddenMenu(
            //         name: "Booking",
            //         colorLineSelected: Colors.grey,
            //         baseStyle: ThemeInfo().bodyMTextStyle,
            //         selectedStyle: Theme.of(context).brightness == Brightness.light
            //             ? ThemeInfo().darkBodyMTextSStyle
            //             : ThemeInfo().lightBodyMTextSStyle),
            //     const Booking()),
            ScreenHiddenDrawer(
                ItemHiddenMenu(
                    name: "Suggest",
                    colorLineSelected: Colors.grey,
                    baseStyle: ThemeInfo().bodyMTextStyle,
                    selectedStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24.0)),
                const Suggest()),
          ],
          backgroundColorMenu: Theme.of(context).backgroundColor,
        ));
  }
}
