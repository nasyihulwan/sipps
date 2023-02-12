import 'package:flutter/material.dart';
import 'package:sipps/features/account/widgets/account_button.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Pesanan Saya',
              onTap: () {},
            ),
            AccountButton(
              text: 'Mulai Jual',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Keluar',
              onTap: () {},
            ),
            AccountButton(
              text: 'Favorit Saya',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
