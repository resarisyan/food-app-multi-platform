import 'package:flutter/material.dart';

class StatusPesanan extends StatelessWidget {
  late String status;

  StatusPesanan({required this.status});

  @override
  Widget build(BuildContext context) {
    String isStatus;
    Color statusColor;
    IconData statusIcon;

    if (status == '0') {
      isStatus = 'Pesanan Dibatalkan';
      statusColor = Colors.red;
      statusIcon = Icons.cancel;
    } else if (status == '1') {
      isStatus = 'Pesanan Belum Diproses';
      statusColor = Colors.orange;
      statusIcon = Icons.assignment_late;
    } else if (status == '2') {
      isStatus = 'Pesanan Sedang Diproses';
      statusColor = Colors.blue;
      statusIcon = Icons.sync;
    } else if (status == '3') {
      isStatus = 'Pesanan Dalam Perjalanan';
      statusColor = Colors.lightBlueAccent;
      statusIcon = Icons.motorcycle;
    } else {
      isStatus = 'Pesanan Selesai';
      statusColor = Colors.green;
      statusIcon = Icons.assignment_turned_in;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 10.0,
          ),
          child: Text(
            'STATUS PESANAN',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 12.0,
            ),
            textAlign: TextAlign.center,
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
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  statusIcon,
                  color: statusColor,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Text(
                    '$isStatus',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      color: statusColor,
                      fontSize: 13.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
