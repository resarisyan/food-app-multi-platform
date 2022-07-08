import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catatan extends StatelessWidget {
  late TextEditingController noteController;

  Catatan({required this.noteController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 10.0,
          ),
          child: Text(
            'CATATAN',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 12.0,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Card(
          elevation: 1.0,
          margin: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 15.0,
            right: 15.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.event_note,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: noteController,
                    maxLines: 4,
                    autofocus: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "Tambah Catatan Pesanan",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    maxLengthEnforced: true,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
