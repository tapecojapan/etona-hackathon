import 'package:etona/src/components/components.dart';
import 'package:etona/src/model/model.dart';
import 'package:etona/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NamedSquareCard extends StatelessWidget {
  const NamedSquareCard({
    Key? key,
    required this.etona,
    this.onNamePage,
  }) : super(key: key);

  final Etona etona;
  final void Function()? onNamePage;

  @override
  Widget build(BuildContext context) {
    bool isEdit() {
      if (etona.name == null) {
        return false;
      }
      return etona.name!.isNotEmpty;
    }

    bool naming() {
      return onNamePage != null;
    }

    return GestureDetector(
      onTap: onNamePage,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: SquareCard(
                    photoURL: etona.photoURL,
                    assetURL: getEtonaImage(etona.id),
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    backgroundColor: palette.gray1,
                  ),
                ),
                if (naming())
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: isEdit() ? palette.green2 : palette.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      isEdit() ? Icons.check : Icons.create,
                      color: Colors.white,
                      size: isEdit() ? 24 : 20,
                    ),
                  ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 10, 0, 0),
              width: 100,
              child: SquareTextCard(
                text: etona.name ?? '',
                center: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
