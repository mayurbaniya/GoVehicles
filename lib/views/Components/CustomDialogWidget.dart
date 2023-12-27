import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDialogWidget extends StatelessWidget {

  final String dialogTitle;
  final IconData mainIcon;
  final String dialogContent;


  const CustomDialogWidget({
    super.key,
    required this.dialogTitle,
    required this.mainIcon,
    required this.dialogContent,
  });
  // : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2A303E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(mainIcon,
                  color: Colors.yellowAccent, size: 28),
               Text(
                dialogTitle,
                style: TextStyle(color: Colors.redAccent, fontSize: 24),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  dialogContent,
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
              padding:const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 32,
                  ),
                  foregroundColor: Colors.green,
                  side: BorderSide(color: Colors.lightGreen),
                ),
                onPressed: () => Get.back(),
                child:const Text('back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
