import 'package:flutter/material.dart';

import 'constants.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: kDecentColor,
      child: child,
    );
  }
}

class MyIconCard extends StatelessWidget {
  const MyIconCard({Key? key, required this.image, required this.text, required this.onTap})
      : super(key: key);

  final String image;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return MyCard(
        child: SizedBox(
          width: 170,
          child: Column(
            children: [
              GestureDetector(
                  onTap: onTap as void Function()?,
                  child: Center(
                      child: Column(
                        children: [
                          Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(image),
                              )),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Column(
                                children: [
                                  Text(
                                    text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ))
                        ],
                      )))
            ],
          ),
        ));
  }
}

class MyImageCard extends StatelessWidget {
  const MyImageCard({Key? key, required this.image, required this.text, required this.onTap, required this.child})
      : super(key: key);

  final String image;
  final String text;
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyCard(
        child: Column(
          children: [
            GestureDetector(
                onTap: onTap as void Function()?,
                child: Center(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image(
                              image: AssetImage(image),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  text,
                                ),
                                Container(child: child)
                              ],
                            ))
                      ],
                    )))
          ],
        ));
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({Key? key, this.title, this.subtitle, this.trailing, this.leading, this.dense, this.onTap, this.spaceBetween = 5}) : super(key: key);
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final bool? dense;
  final Function? onTap;
  final double spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: spaceBetween),
        decoration: BoxDecoration(
          color: kDecentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: title,
          subtitle: subtitle,
          leading: leading,
          trailing: trailing,
          dense: dense,
          onTap: onTap as void Function()?,
        ));
  }
}
