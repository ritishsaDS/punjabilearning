import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


import '../main.dart';

var getBusinessValue;

class ActionSheet {
  Widget actionSheet(
      BuildContext context, {
        Function onCamera,
        Function onGallery,
      }) {
    return CupertinoActionSheet(
      title: Text(
        "Smart Trucker",
        style: secondaryTextStyle(),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            onCamera();
            finish(context);
          },
          child: Text('Camera', style: primaryTextStyle(size: 18)),
          isDefaultAction: true,
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            onGallery();
            finish(context);
          },
          child: Text('Gallery', style: primaryTextStyle(size: 18)),
          isDefaultAction: true,
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            finish(context);
          },
          child: Text(
            'Cancel',
            style: primaryTextStyle(color: Colors.black, size: 18),
          )),
    );
  }
}


void mSimpleBottomSheet() {
  Widget mOption(var icon, var value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.black54,
          ),
          16.width,
          Text(value,
              style:
              primaryTextStyle(size: 16, color: Colors.black))
        ],
      ),
    );
  }

/*  showModalBottomSheet(
      context: context,
      backgroundColor: appStore.scaffoldBackground,
      builder: (builder) {
        return Container(
          height: 160.0,
          color: Colors.transparent,
          child: Column(
            children: [
              mOption(Icons.share, "Share").onTap(() {
                finish(context);
                toast('share');
              }),
              mOption(Icons.link, "Get Link").onTap(() {
                finish(context);
                toast('Get Link');
              }),
              mOption(Icons.edit, "Edit Name").onTap(() {
                finish(context);
                toast('Edit Name');
              }),
            ],
          ),
        );
      });*/
}
