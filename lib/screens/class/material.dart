import 'package:e_learning_app/core/provider/detailClass_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({Key? key}) : super(key: key);

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailClassProvider(),
      child: Consumer<DetailClassProvider>(
        builder: (context, classProv, _) {
          // classProv.detailMaterial();
          void initState() {
            classProv.detailMaterial();
          }

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  PhosphorIcons.arrowArcLeftFill,
                  // color: Colors.wh,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: kpink,
            ),
            body: SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "classProv.detailMateri?[" "]",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text(
                        """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."""),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "File Lampiran",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
