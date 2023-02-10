import 'package:flutter/material.dart';

Widget buildArticleItem(article,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0,),
          image: DecorationImage(
            //${article['urlToImage']}
            image: NetworkImage(article['urlToImage']==null?'https://play-lh.googleusercontent.com/B_4_KpOJKIqi8hI41KMdY3tj2u7h03iCXqLLy5KohaNRpou5P79U1lKOyOq-9GGIXYk':article['urlToImage']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 15.0,
      ),
    ],
  ),
);

Widget articleBuilder(list) => list.length > 0?
ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context, index) => buildArticleItem(list[index],context),
  separatorBuilder: (context, index) => myDivider(),
  itemCount: 10,):Center(child: CircularProgressIndicator());

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

