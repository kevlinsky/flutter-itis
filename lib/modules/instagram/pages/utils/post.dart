import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_itis/modules/instagram/models/image.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class Post extends StatefulWidget {
  final String author;
  final List<PostImage> images;
  final int timestamp;
  int likesCount;
  final int commentsCount;
  final String description;

  Post(
      this.likesCount,
      {required this.author,
      required this.images,
      required this.timestamp,
      required this.commentsCount,
      required this.description});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _liked = false;
  bool _saved = false;
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // author
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //profile photo
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // account name
                  GestureDetector(
                    child: Text(widget.author,
                        overflow: TextOverflow.ellipsis,
                    ).fontWeight(FontWeight.bold),
                    onTap: () => showDialog<String>(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Alert'),
                              content: Text(
                                  'Redirected to ${widget.author} instagram account'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: Text('OK'),
                                )
                              ],
                            )),
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        // image
        Container(
          child: CarouselSlider.builder(
              itemCount: widget.images.length,
              itemBuilder: (context, itemIndex, pageViewIndex) {
                if (widget.images.cast()[itemIndex].fromNet){
                  return Image.network(widget.images.cast()[itemIndex].link);
                } else {
                  return Image.file(File(widget.images.cast()[itemIndex].link));
                }
              },
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason){
                  setState(() {
                    _currentImageIndex = index;
                  });
                }
              ))
        ),
        // action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 5.0, bottom: 10.0),
                    constraints: BoxConstraints(),
                    onPressed: () {
                      setState(() {
                        this._liked = !this._liked;
                        widget.likesCount == 0? widget.likesCount = 1: widget.likesCount = 0;
                      });
                    },
                    icon: (this._liked)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_outline)),
                IconButton(
                  padding: EdgeInsets.only(
                      left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(Icons.chat_bubble_outline),
                ),
                IconButton(
                  padding: EdgeInsets.only(
                      left: 5.0, top: 10.0, right: 10.0, bottom: 10.0),
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(Icons.send_outlined),
                ),
              ],
            ),
            widget.images.length > 1
            ? Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.map((linkOfItem) {
                int index = widget.images.indexOf(linkOfItem);
                return Container(
                  width: 7.0,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                );
              }).toList(),
            )
            : SizedBox(),
            SizedBox(
              width: 35,
            ),
            IconButton(
                padding: EdgeInsets.only(
                    left: 10.0, top: 10.0, right: 5.0, bottom: 10.0),
                constraints: BoxConstraints(),
                onPressed: () {
                  setState(() {
                    this._saved = !this._saved;
                  });
                },
                icon: (this._saved)
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_outline)),
          ],
        ),
        // likes
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Text('Liked by: '),
              GestureDetector(
                child: Text(widget.likesCount.toString())
                    .fontWeight(FontWeight.bold),
                onTap: () => showDialog<String>(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Alert'),
                          content: Text(
                              'Redirected to list of people who liked this post'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text('OK'),
                            )
                          ],
                        )),
              ),
              Text(' people')
            ],
          ),
        ),
        // description
        Padding(
            padding: EdgeInsets.only(left: 10, top: 8.0, right: 10.0),
            child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.author,
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () => showDialog<String>(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Alert'),
                                content: Text(
                                    'Redirected to ${widget.author} instagram account'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text('OK'),
                                  )
                                ],
                              )),
                  ).fontWeight(FontWeight.bold),
                  TextSpan(text: ' '),
                  TextSpan(text: widget.description)
                ]).textColor(Colors.black))),
        // comments
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 8.0),
          child: Text('Watch all comments (${widget.commentsCount.toString()})')
              .textColor(Colors.grey),
        ),
        // timestamp
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 8.0, bottom: 10.0),
          child: Text(
            timeago
                .format(DateTime.fromMillisecondsSinceEpoch(widget.timestamp)),
          ).fontSize(11.0).textColor(Colors.grey),
        )
      ],
    );
  }
}
