import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF383838),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: const Color(0xFFff7b00),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 32,
                    ),
                    const Text(
                      'Projeto: Nome do Projeto',
                      style: TextStyle(
                        color: Color(0xFFff7b00),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: PageView.builder(
                  itemCount: 40,
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (contex, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 250),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: const Color(0xFFff7b00),
                      ),
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/Basquete$index.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color(0xFFff7b00),
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 100),
                  FloatingActionButton(
                    backgroundColor: const Color(0xFFff7b00),
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(40, (index) {
                  if (index == pageIndex) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFff7b00),
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
