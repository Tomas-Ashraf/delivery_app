import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final Function(int) onChanged;

  const ImageCarousel({
    super.key,
    required this.images,
    required this.onChanged,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          /// 🔥 CAROUSEL IMAGES
          PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              widget.onChanged(index);
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 10),

                  /// 🔥 FLOATING IMAGE (bigger + better shadow)
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          /// 🔥 INDICATORS (closer to card)
          Positioned(
            bottom: 0,
            child: Row(
              children: List.generate(
                widget.images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: currentIndex == index ? 12 : 8,
                  height: currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? const Color(0xFFFF5722)
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
