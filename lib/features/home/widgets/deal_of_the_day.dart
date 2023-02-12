import 'package:flutter/material.dart';
import 'package:sipps/features/home/widgets/home_single_product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  // Product? product;
  // final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    // product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    // Navigator.pushNamed(
    //   context,
    //   ProductDetailScreen.routeName,
    //   arguments: product,
    // );
  }

  // temp list
  List list = [
    'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
    'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
    'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
    'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
    'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return
        // product == null ? const Loader() : product!.name.isEmpty ? const SizedBox() :
        GestureDetector(
      onTap: navigateToDetailScreen,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: const Text(
              'Rekomendasi',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Image.network(
            'https://i.ibb.co/ry15sFp/626eda7a-bba9-4f76-b1d8-fe4b3bfbf600-removebg-preview-1.png',
            height: 235,
            fit: BoxFit.fitHeight,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.topLeft,
            child: const Text(
              '\Rp 2,099,000',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
            child: const Text(
              'Air Jordan 1 Mid SE',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 170,
            padding: const EdgeInsets.only(
              left: 10,
              top: 20,
              right: 0,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return HomeSingleProduct(
                  image: list[index],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'Lihat Semua Rekomendasi',
              style: TextStyle(
                color: Colors.cyan[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
