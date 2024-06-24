import 'package:flutter/material.dart';
import 'package:thd_tfrs/screens/first_page/components/widget/footerText.dart';
import 'package:thd_tfrs/translations.dart';


class footer extends StatefulWidget {
  const footer({Key key}) : super(key: key);

  @override
  _footerState createState() => _footerState();
}

class _footerState extends State<footer> {
  List<String> myTHD = [
    allTranslations.text("LectureSchedule"),
    allTranslations.text("FindAContactPerson"),
    allTranslations.text("RequestSolidWorksKey"),
    allTranslations.text("RegisterAnEvent"),
    allTranslations.text("ViewEvents"),
    allTranslations.text("BugReport"),
    allTranslations.text("Pruefungen")
  ];

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
    allTranslations.text("MediaRelations"),
    allTranslations.text("simpleDefinition"),
    allTranslations.text("LocationsDirections"),
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
    allTranslations.text("FacilitiesServices"),
    allTranslations.text("PracticalInformation"),
  ];

  List<String> students = [
    allTranslations.text("A-Z"),
    allTranslations.text("Faculties"),
    allTranslations.text("LanguagesElectives"),
    allTranslations.text("Library"),
    allTranslations.text("Career"),
    allTranslations.text("BugReport"),
    allTranslations.text("Pruefungen")
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
    allTranslations.text("Contact")
  ];

  List<String> furtherEdu = [
    allTranslations.text("BachelorProgrammes"),
    allTranslations.text("MasterProgrammes"),
    allTranslations.text("Certificates"),
    allTranslations.text("InformationHowToApply"),
    allTranslations.text("Projects"),
    allTranslations.text("Events"),
    allTranslations.text("Contact")
  ];

  List<String> business = [
    allTranslations.text("Recruiting"),
    allTranslations.text("SponsoringDonating"),
    allTranslations.text("STEMRegion"),
    allTranslations.text("In-houseTraining"),
    allTranslations.text("JobShadowing"),
    allTranslations.text("DigitalisationInDialogue"),
    allTranslations.text("ScienceForBusiness"),
    allTranslations.text("Events"),
    allTranslations.text("Co-Working-Space")
  ];

  footerTextext(String txt) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        child: Text(
          txt,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 80, right: 80),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 30,
        runSpacing: 50,
        children: [
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("MyDIT"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: myTHD.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: myTHD[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("AboutDIT"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: aboutDIT.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: aboutDIT[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("StudyWithUs"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: studyWithUs.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: studyWithUs[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("Students"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: students.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: students[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("Research"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: research.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: research[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("FurtherEducation"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: furtherEdu.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: furtherEdu[index]);
                      }),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allTranslations.text("Business"),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: business.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return footerText(txt: business[index]);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
