import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String phone;
  final String location;

  const ClinicCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- الصورة --------
            Expanded(
              flex: 2,
              child: (imageUrl.isNotEmpty)
                  ? ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover, // يملأ المساحة بالكامل
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              "assets/images/r3.png",
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        "assets/images/r3.png",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),

            // -------- البيانات --------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),

                    Text(
                      phone,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),

                    Text(
                      location,
                      style: const TextStyle(fontSize: 7, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
