import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';
import 'package:travelok_vietnam_app/Views/Home/components/LoadingCard.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class CardTravelL extends StatefulWidget {
  const CardTravelL({Key? key}) : super(key: key);

  @override
  State<CardTravelL> createState() => _CardTravelLState();
}

class _CardTravelLState extends State<CardTravelL> {
  // BOOKMARK ICON
  bool isBookmark = false;
  void _toggleBookmark() {
    setState(() {
      if (isBookmark) {
        isBookmark = false;
      } else {
        isBookmark = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: RepositoryTravel().getTravel(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 450,
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemExtent: 300,
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var travel = snapshot.data?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTravel(
                          travel: snapshot.data?[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black12,
                    color: constants.AppColor.xOverViewBackgroundColor,
                    margin: const EdgeInsets.only(right: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          // IMAGE
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    '${travel?.imageUrl}',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 16,
                                  top: 16,
                                  child: GestureDetector(
                                    onTap: () {
                                      _toggleBookmark();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: constants
                                              .AppColor.xBlackBackgroundColor,
                                          shape: BoxShape.circle),
                                      child: (isBookmark
                                          ? Icon(
                                              Icons.bookmark_border,
                                              color: constants.AppColor
                                                  .xOverViewBackgroundColor,
                                            )
                                          : Icon(
                                              Icons.bookmark,
                                              color: constants
                                                  .AppColor.xBackgroundColor,
                                            )),
                                      // const Icon(
                                      //   Icons.bookmark_border,
                                      //   color: Colors.white,
                                      // ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          // CONTENT 1
                          Container(
                            margin: const EdgeInsets.only(
                                left: 4, right: 8, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "${travel?.title}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: constants.AppColor.xDarkTextColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      "${travel?.rating}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            constants.AppColor.xDarkTextColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          // CONTENT 2
                          Container(
                            margin: const EdgeInsets.only(
                                left: 4, right: 8, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: constants.AppColor.xGrayTextColor,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      "${travel?.country}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: constants
                                              .AppColor.xGrayTextColor),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: constants
                                              .AppColor.xBackgroundColor,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Không có dữ liệu, vui lòng thử lại sau!'),
          );
        } else {
          return LoadingCard();
        }
      },
    );
  }
}
