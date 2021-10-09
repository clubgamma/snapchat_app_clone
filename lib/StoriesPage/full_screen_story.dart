import 'package:flutter/material.dart';

class FullScreenStoryPage extends StatelessWidget {
  const FullScreenStoryPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  /// A random default url of the image to be shown.
  final String imageUrl =
      'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80';

  /// A random default url of the image to be shown as avatar.
  final String avatarUrl =
      'https://media.istockphoto.com/photos/portrait-of-happy-mature-man-smiling-picture-id1278978817?b=1&k=20&m=1278978817&s=170667a&w=0&h=iS-4Ma_LZ4BCznYaJZQsQwD5Ygtqzzuls6V5QUchFSY=';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              // back button
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              const SizedBox(width: 10),

              // avatar of the user
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                backgroundImage: Image.network(
                  avatarUrl,
                  fit: BoxFit.cover,
                ).image,
              ),
              const SizedBox(width: 10),

              // username and upload time
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'jhonny', // change the username here
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '5 hours ago', // change the upload time here
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              // favorite button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border_rounded,
                ),
              ),

              // more options button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                ),
              ),
            ],
          ),
        ),

        // image to be shown
        body: Center(
          child: Hero(
            tag: index,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
