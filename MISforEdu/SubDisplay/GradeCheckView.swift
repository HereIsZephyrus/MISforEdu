//
//  GradeCheckView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct GradeCheckView: View {
    struct DisplayGradeInfo{
        let name : String
        let school : String
        let assessment : String
        let type : String
        let grade : String
        let GPA : String
    }
    //@Binding var user : Optional<Student>
    //let user : Optional<Student>
    @State var gradeList : [DisplayGradeInfo]
    @State var lectureFilter : Filter
    @State var attendenceFilter : Filter
    var attendenceList : [AttendenceInfo] = [AttendenceInfo]()
    var lecturelist : [LectureInfo] = [LectureInfo]()
    init(user : Optional<Student>){
        if let student = user{
            self.attendenceFilter = Filter()
        }
        else{
            self.attendenceFilter = Filter()
        }
        self.lectureFilter = Filter()
        gradeList = [DisplayGradeInfo]()
    }
    var body: some View {
        //ndenceList = DisplayInterface<AttendenceInfo>(filter: attendenceFilter).Fatch()
        //orEach(attendenceList, id: \.classID){item in
            //self.lectureFilter = Filter()
            //self.lecturelist.append(DisplayInterface<LectureInfo>(filter: lectureFilter).Fatch())
        //}
        //lectureFilter = Filter()
        let lectureList = DisplayInterface<LectureInfo>(filter: lectureFilter).Fatch()
        NavigationStack{
            List {
                //GradeBar(lecture: ex_courses[0], attend: ex_attendence[0])
                //GradeBar(lecture: ex_courses[1], attend: ex_attendence[1])
            }.listStyle(.insetGrouped)
           Text("Text")
        }
    }
    func GradeBar (lecture :DisplayGradeInfo) -> some View {
    //func GradeBar (lecture : LectureInfo,attend : AttendenceInfo) -> some View {
            return
                HStack {
                    Text(lecture.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(lecture.school) .foregroundColor(.secondary)
                    //Text("类型: \(lecture.type.rawValue)") .foregroundColor(.secondary)
                    Text("类型: \(lecture.type)") .foregroundColor(.secondary)
                    //Text("考核方式: \(lecture.assessment.rawValue)").foregroundColor(.secondary)
                    Text("考核方式: \(lecture.assessment)").foregroundColor(.secondary)
                    //Text("成绩: " + floatFormatter.string(from: NSNumber(value: attend.score))!).foregroundColor(.secondary)
                    Text("成绩: \(lecture.grade)").foregroundColor(.secondary)
                    //Text("GPA: " + CalcGPA(credit: lecture.credit, score : attend.score) ).foregroundColor(.secondary)
                    Text("GPA: \(lecture.GPA)").foregroundColor(.secondary)
                }
                .padding()
            func CalcGPA(credit : Float, score : Float) -> String{
                let level = Int((score - 60) / 5 + 2)
                let GPA = credit * Float(level)  / 2
                return floatFormatter.string(from: NSNumber(value: GPA))!
        }
        }
}

struct GradeCheckView_Previews: PreviewProvider {
    static var previews: some View {
        GradeCheckView(user :ex_student)
    }
}

