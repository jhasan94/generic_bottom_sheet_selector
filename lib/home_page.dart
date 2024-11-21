import 'package:flutter/material.dart';
import 'package:generic_bottom_sheet_selector/widgets/buttom_sheet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Country> countries = [
    Country(id: 1, name: "Bangladesh"),
    Country(id: 2, name: "India"),
    Country(id: 3, name: "US"),
    Country(id: 4, name: "UK"),
  ];

  String countryName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await BottomSheetWidget.showBottomSheet(
                    items: countries,
                    context: context,
                    onTap: (country) {
                      setState(() {
                        countryName = country.name;
                      });
                    },
                  );
                },
                child: const Text("Show Bottom Sheet Items")),
            Text(countryName),
          ],
        ),
      ),
    );
  }
}

class Country extends BottomSheetItem {
  int id;
  String name;
  Country({required this.id, required this.name});

  @override
  String get title => name;
}
