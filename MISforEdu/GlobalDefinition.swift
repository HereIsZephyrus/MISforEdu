//
//  Global.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/17/24.
//

import Foundation
//enum items
enum user_role {
    case Student
    case Teacher
    case Secretary
    case HR
    case Dean
}
enum roombutton_state {
    case avaliable
    case unavaliable
    case selected
}
enum sex_type{
    case male
    case famale
}
enum title_type{
    case professor
    case associate_professor
    case lecturer
}
enum credit_type{
    case test
    case exam
    case none
}
enum lecture_type{
    case basic
    case restricted
    case elective
}
enum update_status{
    case successful
    case connection_failed
    case authority_failed
    case integrity_failed
    case conflict
}
enum style_format{
    case title
    case brief
    case detail
}
//filter
enum filter_input_type{
    case option
    case textfill
}
struct FilterItem {
    let title: [String]
    let inputType : [filter_input_type]
    let predicate: [[String]]
    let item: [[String]]
    let num: Int

    init(title: [String],inputType : [filter_input_type], predicate: [[String]], item: [[String]]) {
        self.title = title
        self.inputType = inputType
        self.predicate = predicate
        self.item = item
        self.num = title.count
    }
}
struct Filter{
    
}

//lecture
struct Lecture :Identifiable {
    var id: Int
    var name: String
    var school: String
    var type: String
    var credit: Float
    var assessment: String
}
struct Class :Identifiable {
    var id: String
    var lecture: String
    var schedule: String
    var classroom: String
}
struct Instruction :Identifiable {
    var id: Int
    var classId: Int
    var teacherId: Int
    var appraise: Float
}
struct Attendance :Identifiable {
    var id: Int
    var classId: String
    var studentId: Int
    var score: Int
}
struct Syllabus :Identifiable {
    var id: String
    var startWeek: Int
    var termWeek: Int
    var remark: String
    var Speriod: Int
}
struct Timetable :Identifiable {
    var id: String
    var classId: String
    var enumValue: Int
}
//school
struct Subjects :Identifiable {
    var id: Int
    var name: String
    var code: String
    var school: String
}
struct School :Identifiable {
    var id: Int
    var name: String
    var building: Int
}
