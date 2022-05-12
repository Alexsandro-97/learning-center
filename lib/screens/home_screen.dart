import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myrobot_app/resources/cursos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _cursoSelected = 'First';
  List<String> _aulaCursoSelected = Courses.cursosFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color(0xFF383838),
            width: 250,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  height: 65,
                  child: SvgPicture.asset(
                    'assets/images/myrobot-logo.svg',
                    semanticsLabel: 'My Robot Logo',
                    fit: BoxFit.cover,
                    height: 300,
                    width: 300,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: ListView.separated(
                      itemCount: Courses.cursos.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (Courses.cursos[index] == 'First') {
                            setState(() {
                              _cursoSelected = 'First';
                              _aulaCursoSelected = Courses.cursosFirst;
                            });
                          } else if (Courses.cursos[index] == 'One') {
                            setState(() {
                              _cursoSelected = 'One';
                              _aulaCursoSelected = Courses.cursosOne;
                            });
                          } else if (Courses.cursos[index] == 'Tech') {
                            setState(() {
                              _cursoSelected = 'Tech';
                              _aulaCursoSelected = Courses.cursosTech;
                            });
                          }
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFff7b00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              Courses.cursos[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  width: 300,
                  height: 65,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF2a2a2a),
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                  left: 85,
                  right: 85,
                ),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                children: List.generate(
                  45,
                  (index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$_cursoSelected - Aula ${index + 1}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFff7b00),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFFff7b00),
                          ),
                          child: Center(
                              child: Text(
                            'Projeto: ${_aulaCursoSelected[index]}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
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
