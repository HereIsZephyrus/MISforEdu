//
//  GradeCheckView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct GradeCheckView: View {
    @Binding var user : Optional<Student>
        @State private var classIdToSearch: String = ""
    @State private var name: String = ""
        @State private var grade: String = ""
        
    var body: some View {
        NavigationStack{
           Text("Text")
        }
    }
    /*
    func GradeBar (lecture : LectureInfo,attend : AttendenceInfo) -> some View {
            return
                HStack {
                    Text(lecture.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text(lecture.school)
                        //.font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("类型: \(lecture.type.rawValue)")
                        .foregroundColor(.secondary)
                    
                    Text("考核方式: \(lecture.assessment.rawValue)")
                        .foregroundColor(.secondary)
                    Text("成绩: \(attend.score)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("GPA: \(CalcGPA(credit: lecture.credit, score : attend.score))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
            func CalcGPA(credit : Float, score : Float) -> Float{
            //let level = Int((score - 60) / 5 + 2)
            //return credit * Float(level)  / 2
                return 1.0
        }
        }*/
}

struct GradeCheckView_Previews: PreviewProvider {
    static var previews: some View {
        GradeCheckView(user : .constant(ex_student))
    }
}

