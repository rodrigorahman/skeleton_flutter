import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey[300],
          child: Container(
            margin: EdgeInsets.all(7.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 280,
                      height: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 280 * 0.75,
                      height: 15,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
