import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ChoiceName extends StatelessWidget {
  const ChoiceName({
    Key? key,
    required this.etona,
    required this.names,
    required this.onTap,
  }) : super(key: key);

  final Etona etona;
  final List<String> names;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          width: double.infinity,
          child: SquareCard(
            sizeType: SizeType.large,
            photoURL: etona.photoURL,
            assetURL: getEtonaImage(etona.id),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            backgroundColor: palette.gray1,
          ),
        ),
        SizedBox(
          width: 240,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: OutlinedTextButton(
                  colorType: ColorType.black,
                  text: names[index],
                  onPressed: () {
                    onTap(index);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
