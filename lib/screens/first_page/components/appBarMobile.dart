import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

class appBarTablet extends StatefulWidget {
  const appBarTablet({Key key}) : super(key: key);

  @override
  _secondAppBarState createState() => _secondAppBarState();
}

class _secondAppBarState extends State<appBarTablet>
    with TickerProviderStateMixin {
  double appBarItemsPadding = 25;

  bool about_dit_vis = false;
  bool study_with_vis = false;
  bool student_vis = false;
  bool research_vis = false;
  bool further_education_vis = false;
  bool business_vis = false;

  AnimationController _animationController;
  bool isPlaying = false;

  Size screenSize;

  firstAppBarText(String txt) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: txt, description: "firstAppBar",)),
          );
        },
        child: Container(
          child: Text(
            txt,
            style: TextStyle(
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  secondAppBarText(String txt) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  showMenuItem(String str) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
        child: Text(
          str,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  aboutDITMenu() {
    return Visibility(
      visible: about_dit_vis,
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            about_dit_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            about_dit_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('News'),
              showMenuItem('Events'),
              showMenuItem('Contact'),
              showMenuItem('Campus locations'),
              showMenuItem('Job vacancies'),
              showMenuItem('International'),
              showMenuItem('DIT Vital'),
              showMenuItem('Publications'),
              showMenuItem('University profile'),
              showMenuItem('Friends and associates'),
              showMenuItem('Quality management'),
              showMenuItem('Alumni'),
            ],
          ),
        ),
      ),
    );
  }

  studyWithUsMenu() {
    return Visibility(
      visible: study_with_vis,
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            study_with_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            study_with_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('Why study at DIT'),
              showMenuItem('Course choices'),
              showMenuItem('Info events'),
              showMenuItem('Engage with us'),
              showMenuItem('How to apply'),
              showMenuItem('International students'),
              showMenuItem('International exchange students'),
              showMenuItem('Module & guest students'),
              showMenuItem('Prep courses'),
              showMenuItem('Facilities & services'),
              showMenuItem('Practical information'),
            ],
          ),
        ),
      ),
    );
  }

  studentMenu() {
    return Visibility(
      visible: student_vis,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            student_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            student_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('A-Z'),
              showMenuItem('Faculties'),
              showMenuItem('Languages & Electives'),
              showMenuItem('Library'),
              showMenuItem('Career'),
              showMenuItem('Starting a business'),
              showMenuItem('IT services'),
              showMenuItem('Organisation & documents'),
              showMenuItem('Campus life'),
              showMenuItem('Work & study abroad'),
              showMenuItem('After graduation'),
              showMenuItem('International students'),
              showMenuItem('Advise & support'),
            ],
          ),
        ),
      ),
    );
  }

  researchMenu() {
    return Visibility(
      visible: research_vis,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            research_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            research_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('Main research areas'),
              showMenuItem('Research groups'),
              showMenuItem('Institutes'),
              showMenuItem('Technology campuses'),
              showMenuItem('Projects'),
              showMenuItem('Labs'),
              showMenuItem('Scientific publications'),
              showMenuItem('Events'),
              showMenuItem('Doctorate'),
              showMenuItem('Knowledge & technology transfer'),
              showMenuItem('Funding advice'),
              showMenuItem('Contact'),
              showMenuItem('Doctorate'),
              showMenuItem('Alumni'),
            ],
          ),
        ),
      ),
    );
  }

  furtherEducationMenu() {
    return Visibility(
      visible: further_education_vis,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            further_education_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            further_education_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('Bachelor programmes'),
              showMenuItem('Master programmes'),
              showMenuItem('Certificates'),
              showMenuItem('Information & how to apply'),
              showMenuItem('Projects'),
              showMenuItem('Events'),
              showMenuItem('Contact'),
            ],
          ),
        ),
      ),
    );
  }

  businessMenu() {
    return Visibility(
      visible: business_vis,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            business_vis = true;
          });
        },
        onExit: (event) {
          setState(() {
            business_vis = false;
          });
        },
        child: Container(
          width: screenSize.width,
          color: Colors.black.withOpacity(0.6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showMenuItem('Recruiting'),
              showMenuItem('Sponsoring & donating'),
              showMenuItem('STEM region'),
              showMenuItem('Campus locations'),
              showMenuItem('In-house training'),
              showMenuItem('Job shadowing'),
              showMenuItem('Digitalisation in Dialogue'),
              showMenuItem('Science for business'),
              showMenuItem('Events'),
              showMenuItem('University profile'),
              showMenuItem('Co-Working-Space'),
            ],
          ),
        ),
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    appBarItemsPadding = screenSize.width / 60;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (screenSize.width >= 750) largeWindow(),
              Container(
                color: Colors.black.withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                        child: Image(
                          image: AssetImage('images/DIT_Logo.png'),
                          width: 300,
                          color: Colors.white,
                        )),
                    IconButton(
                      iconSize: 50,
                      splashColor: Colors.greenAccent,
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController,
                        color: Colors.white,
                      ),
                      onPressed: () => _handleOnPressed(),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isPlaying,
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      switch (index) {
                        case 0:
                          about_dit_vis = !about_dit_vis;
                          break;
                        case 1:
                          study_with_vis = !study_with_vis;
                          break;
                        case 2:
                          student_vis = !student_vis;
                          break;
                        case 3:
                          research_vis = !research_vis;
                          break;
                        case 4:
                          further_education_vis = !further_education_vis;
                          break;
                        case 5:
                          business_vis = !business_vis;
                          break;
                        default:
                          break;
                      }
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('About DIT'));
                      },
                      body: aboutDITMenu(),
                      isExpanded: about_dit_vis,
                    ),
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Study with us'));
                      },
                      body: studyWithUsMenu(),
                      isExpanded: study_with_vis,
                    ),
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Students'));
                      },
                      body: studentMenu(),
                      isExpanded: student_vis,
                    ),
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Research'));
                      },
                      body: researchMenu(),
                      isExpanded: research_vis,
                    ),
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Further education'));
                      },
                      body: furtherEducationMenu(),
                      isExpanded: further_education_vis,
                    ),
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Business'));
                      },
                      body: businessMenu(),
                      isExpanded: business_vis,
                    ),
                  ],
                ),
              ),
              if (screenSize.width < 750) mobileWindow(),
            ],
          ),
        ),
      ],
    );
  }

  largeWindow() {
    return Container(
      color: Color(0xFFF7F6F8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, top: 15, bottom: 15),
            child: Row(
              children: [
                firstAppBarText("Press"),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                firstAppBarText("Alumni"),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                firstAppBarText("International"),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                firstAppBarText("Blog"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40, top: 15, bottom: 15),
            child: Row(
              children: [
                MouseRegion(
                    cursor: SystemMouseCursors.click, child: Text("EN | DE")),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(Icons.person)),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(Icons.shopping_cart_outlined)),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click, child: Icon(Icons.print)),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                Container(
                  width: screenSize.width / 8,
                  alignment: Alignment.center,
                  child: TextField(
                    minLines: 1,
                    onChanged: (value) {},
                    style: TextStyle(
                        fontSize: 12.0, height: 2.0, color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: 'Google..',
                    ),
                  ),
                ),
                SizedBox(
                  width: appBarItemsPadding,
                ),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Icon(Icons.search)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  mobileWindow() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 40, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              child: MouseRegion(cursor: SystemMouseCursors.click, child: Text("EN | DE"))),
          MouseRegion(
              cursor: SystemMouseCursors.click, child: Icon(Icons.person)),
          MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(Icons.shopping_cart_outlined)),
          MouseRegion(
              cursor: SystemMouseCursors.click, child: Icon(Icons.print)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: screenSize.width / 8,
                alignment: Alignment.center,
                child: TextField(
                  minLines: 1,
                  onChanged: (value) {},
                  style: TextStyle(
                      fontSize: 12.0, height: 2.0, color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: 'Google..',
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              MouseRegion(
                  cursor: SystemMouseCursors.click, child: Icon(Icons.search)),
            ],
          ),
        ],
      ),
    );
  }
}
