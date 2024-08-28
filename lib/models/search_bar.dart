import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:food_app/screens/nav_bar_pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<FoodModel> searchItem = FoodModel.items;
  List<FoodModel> filteredItems = [];

  @override
  void initState() {
    setState(() {
      filteredItems = searchItem;
      super.initState();
    });
  }

  void onSearch(String search) {
    setState(() {
      filteredItems = searchItem
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.11,
                  top: screenHeight * 0.0999,
                  bottom: 5.h),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(const HomePage());
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    width: screenHeight * 0.024,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      autofocus: true,
                      onChanged: (value) => onSearch(value),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xffF9F9F9),
              ),
              height: 78.91.h,
              width: screenWidth,
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Text("Found ${filteredItems.length} results",
                      style: GoogleFonts.nunito(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 3.h,
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 3.h,
                  ),
                  filteredItems.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.15,
                          ),
                          child: Column(
                            children: [
                              Image.asset('images/feather_search.png'),
                              Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Text(
                                  'Item not found',
                                  style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 3.h),
                                ),
                              ),
                              Text(
                                'Try searching the item with',
                                style: GoogleFonts.rubik(
                                    color: const Color.fromARGB(
                                        255, 129, 129, 129)),
                              ),
                              Text('a different keyword.',
                                  style: GoogleFonts.rubik(
                                      color: const Color.fromARGB(
                                          255, 129, 129, 129))),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: filteredItems.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => ItemPage(
                                                      itemDetails:
                                                          filteredItems[i],
                                                    )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          height: 11.5.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 7.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(filteredItems[i].name,
                                                    style: GoogleFonts.nunito(
                                                        color: Colors.black,
                                                        fontSize: 2.h,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Image.asset(
                                                    filteredItems[i].image)
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
