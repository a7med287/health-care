import 'package:flutter/material.dart';

class RecentPostsSliver extends StatelessWidget {
  const RecentPostsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(

      child: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Our Recent Posts",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // Horizontal List
            SizedBox(
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: demoPosts.length,
                separatorBuilder: (_, __) => const SizedBox(width: 18),
                itemBuilder: (context, index) {
                  return _BlogCard(post: demoPosts[index]);
                },
              ),
            ),

            const SizedBox(height: 25),

            // Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A9A5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "READ MORE BLOGS",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      
    );
  }
}

class _BlogCard extends StatelessWidget {
  final Post post;

  const _BlogCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE (smaller height)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              post.image,
              height: 180,      // << أقل طول ممكن بدون ما نفقد الجودة
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // TEXT CONTENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,   // أصغر علشان الكارد بقى أقل
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  post.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.45),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Post {
  final String title;
  final String date;
  final String image;

  Post({required this.title, required this.date, required this.image});
}

final List<Post> demoPosts = [
  Post(
    title: "Designing a Modern UI Layout",
    date: "Oct 18, 2024",
    image: "assets/images/r1.png",
  ),
  Post(
    title: "Why Branding Matters More Than Ever",
    date: "Sep 30, 2024",
    image: "assets/images/r2.png",
  ),
  Post(
    title: "How to Improve User Experience",
    date: "Sep 12, 2024",
    image: "assets/images/r3.png",
  ),
];
