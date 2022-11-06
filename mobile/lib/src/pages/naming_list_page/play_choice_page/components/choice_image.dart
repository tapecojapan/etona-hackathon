import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ChoiceImage extends StatelessWidget {
  const ChoiceImage({
    Key? key,
    required this.etona,
    required this.etonas,
    required this.onTap,
  }) : super(key: key);

  final Etona etona;
  final List<Etona> etonas;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 240,
          child: OutlinedTextButton(
            colorType: ColorType.black,
            text: etona.name ?? '',
          ),
        ),
        GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 144,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 64, 0, 0),
          //itemCount: etonas.length,
          itemCount: etonas.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SquareCard(
                  sizeType: SizeType.medium,
                  photoURL: etonas[index].photoURL,
                  assetURL: getEtonaImage(etonas[index].id),
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  backgroundColor: palette.gray1,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
