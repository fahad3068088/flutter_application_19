import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../responsi/mobail/screens/comments.dart';
import 'colors.dart';

class PostDesign extends StatefulWidget {
  final Map data;
  const PostDesign({super.key, required this.data});

  @override
  State<PostDesign> createState() => _PostDesignState();
}

class _PostDesignState extends State<PostDesign> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: mobileBackgroundColor,
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(
          vertical: 55, horizontal: widthScreen > 600 ? widthScreen / 6 : 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: CircleAvatar(
                        radius: 33,
                        backgroundImage: NetworkImage(widget.data["profileImg"]
                            // "https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg"

                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Text(
                      // "اسم المستخدم"
                      widget.data["username"],
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
          ),
          Image.network(
//  "https://cdn1-m.alittihad.ae/store/archive/image/2021/10/22/6266a092-72dd-4a2f-82a4-d22ed9d2cc59.jpg?width=1300"
            widget.data["imgPost"],
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommentsScreen(data : widget.data)),
                        );
                      },
                      icon: const Icon(
                        Icons.comment_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_outline),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 10, 0, 9),
            width: double.infinity,
            child: Text(
              "${widget.data["likes"].length} ${widget.data["likes"].length > 1 ? "Likes" : "Like"}      ",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            children: [
              Text(widget.data["username"]),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Text(widget.data["username"]),
            ],
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  child: Text(widget.data["description"]))),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 9, 10),
              width: double.infinity,
              child: Text(
                DateFormat('MMMM d, ' 'y')
                    .format(widget.data["datePublished"].toDate()),
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(214, 157, 157, 165)),
                textAlign: TextAlign.start,
              )),
        ],
      ),
    );
  }
}
