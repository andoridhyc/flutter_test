import 'package:flutter/material.dart';
import 'package:hy/model/home_model.dart';

typedef OnLikeTap = Function();

class ImageTextItem extends StatefulWidget {
  final HomeModel item;
  OnLikeTap? onLikeTap;
  ImageTextItem({super.key, required this.item,this.onLikeTap});

  @override
  State<ImageTextItem> createState() => _ImageTextItemState();
}

class _ImageTextItemState extends State<ImageTextItem> {
  @override
  Widget build(BuildContext context) {
    print("huyongchao=>_ImageTextItemState");

    var item = widget.item;
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    "https://www.pngdirs.com/attachment/apricot/apricot-8949.png",
                    width: 50,
                    height: 50),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                "这是用户名这是用户名这是用户名这是用户名这是用户名这是用户名这是用户名这是用户名",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Icon(Icons.ac_unit)
                        ],
                      ),
                      Text(
                        "这是用户描述这",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(5),
                child: Text(
                  "关注",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            item.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            item.body ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            color: Colors.grey,
            child: Image.network(
              "https://www.pngdirs.com/attachment/apricot/apricot-8949.png",
              height: 100,
              width: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.comment),
                      SizedBox(
                        width: 10,
                      ),
                      Text(item.commentsNum?.toString()??"")
                    ],
                  )),
              SizedBox(
                width: 1,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      widget.onLikeTap?.call();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_up_alt_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(item.likeNum?.toString()??"")
                      ],
                    ),
                  )
              ),
              SizedBox(
                width: 1,
                height: 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 10,
                      ),
                      Text(item.shareNum?.toString()??"")
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
