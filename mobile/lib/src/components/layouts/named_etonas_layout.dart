import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:flutter/material.dart';

class NamedEtonasLayout extends StatelessWidget {
  const NamedEtonasLayout({
    Key? key,
    required this.etonas,
    this.onNamePage,
  }) : super(key: key);

  final List<Etona> etonas;
  final void Function(Etona)? onNamePage;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 172,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      itemCount: etonas.length,
      itemBuilder: (BuildContext context, int index) {
        return NamedSquareCard(
          etona: etonas[index],
          onNamePage: onNamePage == null
              ? null
              : () {
                  onNamePage!(etonas[index]);
                },
        );
      },
    );
  }
}
