import 'package:flutter/material.dart';
import 'package:snapchat_clone_main/StoriesPage/full_screen_story.dart';

const double kDefaultPadding = 12;

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'here should be implemented stories and friends section',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Discover',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 5),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              mainAxisSpacing: kDefaultPadding,
              crossAxisSpacing: kDefaultPadding,
              childAspectRatio: 0.6,
              children: List.generate(
                10,
                (int index) => DiscoveryCardWidget(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoveryCardWidget extends StatelessWidget {
  const DiscoveryCardWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FullScreenStoryPage(index: index),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // image to be shown
          _ImageWidget(index: index),

          // shadow over the image
          const _ShadowWidget(),

          // the avatar of the user
          const AvatarWidget(),

          // info about the username
          const _UsernameWidget(),

          // description of the story
          const _DescriptionWidget(),
        ],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  /// A random default url of the image to be shown.
  final String imageUrl =
      'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80';

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Hero(
        tag: index,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// Returns the profile photo of the user.
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  /// Random url for the avatar image.
  final String imageUrl =
      'https://media.istockphoto.com/photos/portrait-of-happy-mature-man-smiling-picture-id1278978817?b=1&k=20&m=1278978817&s=170667a&w=0&h=iS-4Ma_LZ4BCznYaJZQsQwD5Ygtqzzuls6V5QUchFSY=';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 60,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        backgroundImage: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ).image,
      ),
    );
  }
}

/// Return the [Text] that contains the username.
class _UsernameWidget extends StatelessWidget {
  const _UsernameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 30,
      left: 10,
      child: Text(
        'jhonny', // username should be changed here
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// Returns the [Text] that contains the description about the story
/// for example: Today, Sponsored ...
class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        'Today', // change the description here
        style: TextStyle(
          fontSize: 14,
          color: Colors.white60,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}

/// It returns an empty [Container] wich has a black shadow used to clearly read
/// texts over any image.
class _ShadowWidget extends StatelessWidget {
  const _ShadowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
            ],
            stops: [
              0.75,
              1.0,
            ],
          ),
        ),
      ),
    );
  }
}
