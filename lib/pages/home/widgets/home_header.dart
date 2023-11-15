import 'package:flutter/material.dart';
import 'package:mockxl/constant/text_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              // Left Row - Image
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    "https://picsum.photos/200",
                    height: 30,
                    width: 30,
                  )),
              const SizedBox(width: 10),
              Text("087111423161", style: TextConfig.textStyle),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () {},
                  child:
                      const Icon(Icons.add_circle_outline, color: Colors.white))
            ]),
            // Right Row - Bell - Silver
            Row(
              children: [
                Container(
                    width: 50,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                        child: Text("Silver".toUpperCase(),
                            style: TextConfig.textStyle))),
                const SizedBox(
                  width: 10,
                ),
                Stack(children: [
                  const Icon(Icons.notifications, color: Colors.white),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.redAccent),
                      child: const Center(
                          child: Text(
                        "4",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                    ),
                  )
                ])
              ],
            )
          ],
        ));
  }
}
