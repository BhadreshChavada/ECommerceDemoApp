import 'package:flutter/material.dart';

import '../model/ProductResponse.dart';

class ProductDetails extends StatelessWidget {
  Products products;

  ProductDetails({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: products.title!,
      home: Scaffold(
        appBar: AppBar(
          title: Text(products.title!),
        ),
        body: Carousel(products: products),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  Products products;

  Carousel({Key? key, required this.products}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState(products);
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  int activePage = 1;
  Products products;

  _CarouselState(this.products);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: products.images!.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(products.images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(products.images!.length, activePage)),
        Row(children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              products.description.toString(),
              maxLines: 4,
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
            ),
          )),
        ])
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
