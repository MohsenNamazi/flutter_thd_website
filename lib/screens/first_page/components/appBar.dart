import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/first_page/components/widget/appBarOneText.dart';
import 'package:thd_tfrs/screens/second_page/index.dart';

import '../../../translations.dart';


class appBarDesktop extends StatefulWidget {
  const appBarDesktop({Key key}) : super(key: key);

  @override
  _secondAppBarState createState() => _secondAppBarState();
}

class _secondAppBarState extends State<appBarDesktop>
    with SingleTickerProviderStateMixin {


  double appBarItemsPadding = 25;

  bool about_dit_vis = false;
  bool study_with_vis = false;
  bool student_vis = false;
  bool research_vis = false;
  bool further_education_vis = false;
  bool business_vis = false;
  bool text_underline = false;

  String search = "";

  AnimationController _controller;
  Animation _animation;

  List<String> aboutDIT = [
    allTranslations.text("news"),
    allTranslations.text("Events"),
    allTranslations.text("Contact"),
    allTranslations.text("CampusLocations"),
    allTranslations.text("JobVacancies"),
    allTranslations.text("MediaGallery"),
    allTranslations.text("International"),
    allTranslations.text("DITVital"),
    allTranslations.text("Publications"),
    allTranslations.text("UniversityProfile"),
    allTranslations.text("FriendsAndAssociates"),
    allTranslations.text("QualityManagement"),
    allTranslations.text("Alumni"),
  ];
  List<String> studyWithUs = [
    allTranslations.text("WhyStudy"),
    allTranslations.text("CourseChoices"),
    allTranslations.text("InfoEvents"),
    allTranslations.text("EngageWithUs"),
    allTranslations.text("HowToApply"),
    allTranslations.text("InternationalStudents"),
    allTranslations.text("InternationalExchangeStudents"),
    allTranslations.text("ModuleGuestStudents"),
    allTranslations.text("PrepCourses"),
    allTranslations.text("FacilitiesAndServices"),
    allTranslations.text("PracticalInformation"),
  ];
  List<String> student = [
    allTranslations.text("A-Z"),
    allTranslations.text("Faculties"),
    allTranslations.text("LanguagesElectives"),
    allTranslations.text("Library"),
    allTranslations.text("Career"),
    allTranslations.text("StartingBusiness"),
    allTranslations.text("ITServices"),
    allTranslations.text("OrganisationDocuments"),
    allTranslations.text("CampusLife"),
    allTranslations.text("WorkStudyAbroad"),
    allTranslations.text("AfterGraduation"),
    allTranslations.text("InternationalStudents"),
    allTranslations.text("AdviceAndSupport"),
  ];

  List<String> research = [
    allTranslations.text("MainResearchAreas"),
    allTranslations.text("ResearchGroups"),
    allTranslations.text("Institutes"),
    allTranslations.text("TechnologyCampuses"),
    allTranslations.text("Projects"),
    allTranslations.text("Labs"),
    allTranslations.text("ScientificPublications"),
    allTranslations.text("Events"),
    allTranslations.text("Doctorate"),
    allTranslations.text("KnowledgeTechnologyTransfer"),
    allTranslations.text("FundingAdvice"),
    allTranslations.text("Contact"),
    allTranslations.text("Alumni"),
  ];

  List<String> furtherEducation = [
    allTranslations.text("BachelorProgrammes"),
    allTranslations.text("MasterProgrammes"),
    allTranslations.text("Certificates"),
    allTranslations.text("InformationHowToApply"),
    allTranslations.text("Projects"),
    allTranslations.text("Events"),
    allTranslations.text("Contact"),
  ];

  List<String> business = [
    allTranslations.text("Recruiting"),
    allTranslations.text("SponsoringAndDonating"),
    allTranslations.text("STEMRegion"),
    allTranslations.text("CampusLocations"),
    allTranslations.text("In-houseTraining"),
    allTranslations.text("JobShadowing"),
    allTranslations.text("DigitalisationInDialogue"),
    allTranslations.text("ScienceForBusiness"),
    allTranslations.text("Events"),
    allTranslations.text("UniversityProfile"),
    allTranslations.text("Co-Working-Space"),
  ];

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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: aboutDIT.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: aboutDIT[index],
                );
              }),
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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: studyWithUs.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: studyWithUs[index],
                );
              }),
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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: student.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: student[index],
                );
              }),
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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: research.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: research[index],
                );
              }),
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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: furtherEducation.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: furtherEducation[index],
                );
              }),
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
          width: 200,
          color: Colors.black.withOpacity(0.6),
          child: new ListView.builder(
              shrinkWrap: true,
              itemCount: furtherEducation.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return appBarOneText(
                  txt: business[index],
                );
              }),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 1.0, end: 1.5).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height: 130,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Color(0xFFF7F6F8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          firstAppBarText(allTranslations.text("Press")),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          firstAppBarText(allTranslations.text("Alumni")),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          firstAppBarText(allTranslations.text("International")),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          firstAppBarText(allTranslations.text("Blog")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 40, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text("EN | DE")),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          AnimatedBuilder(
                            animation: _animation,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Profile icon", description: "firstAppBar",)),
                                );
                              },
                              child: Container(
                                child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Icon(Icons.person)),
                              ),
                            ),
                            builder: (BuildContext context, Widget child) {
                              return Transform.scale(
                                scale: _animation.value,
                                child: child,
                              );
                            },
                          ),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Shopping icon", description: "firstAppBar",)),
                                    );
                                  },
                                  child: Container(child: Icon(Icons.shopping_cart_outlined)))),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: "Print icon", description: "firstAppBar",)),
                                    );
                                  },
                                  child: Container(child: Icon(Icons.print)))),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          Container(
                            width: 250,
                            alignment: Alignment.center,
                            child: TextField(
                              minLines: 1,
                              onChanged: (value) {
                                search = value;
                              },
                              style: TextStyle(
                                  fontSize: 12.0,
                                  height: 2.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                hintText: allTranslations.text("searchGoogle"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: appBarItemsPadding,
                          ),
                          MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => secondPageDesktop(feedback: search, description: "search",)),
                                    );
                                  },
                                  child: Container(child: Icon(Icons.search)))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                    Container(
                      child: Row(
                        children: [
                          Container(
                              width: 90,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
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
                                child: secondAppBarText(allTranslations.text("AboutDIT")),
                              )),
                          Container(
                              width: 120,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
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
                                child: secondAppBarText(allTranslations.text("StudyWithUs")),
                              )),
                          Container(
                              width: 90,
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
                                child: secondAppBarText(allTranslations.text("Students")),
                              )),
                          Container(
                              width: 90,
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
                                child: secondAppBarText(allTranslations.text("Research")),
                              )),
                          Container(
                              width: 140,
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
                                child: secondAppBarText(allTranslations.text("FurtherEducation")),
                              )),
                          Container(
                              width: 90,
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
                                child: secondAppBarText(allTranslations.text("Business")),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 520,
          ),
          child: aboutDITMenu(),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 430,
          ),
          child: studyWithUsMenu(),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 310,
          ),
          child: studentMenu(),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 220,
          ),
          child: researchMenu(),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 30,
          ),
          child: furtherEducationMenu(),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(
            top: 130,
            right: 20,
          ),
          child: businessMenu(),
        ),
      ],
    );
  }
}
