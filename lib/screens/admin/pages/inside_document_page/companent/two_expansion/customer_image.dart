import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../test/image_list/image_list.dart';
class CustomerImage extends StatelessWidget {
  const CustomerImage({Key? key, this.e}) : super(key: key);
 final MyImage? e;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: context.dynamicHeight(0.2),
      width: context.dynamicWidth(0.2),
      child: InkWell(
        onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 24,
                  // title: Text('sdsd'),
                  content: myCustomerFadeInImageAssetNetwork(e),
                ),
            barrierDismissible: true),
        child: myCustomerFadeInImageAssetNetwork(e),
      ),
    );
  }

   FadeInImage myCustomerFadeInImageAssetNetwork(MyImage? e) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/image/loading.gif',
      image: e!.path,
      fit: BoxFit.cover,
    );
  }
}