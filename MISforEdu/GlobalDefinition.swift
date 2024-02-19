//
//  Global.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/17/24.
//

import Foundation
//enum items
enum user_role: String, CaseIterable, Identifiable {
    case Student
    case Teacher
    case Secretary
    case HR
    case Dean
    var id: String { self.rawValue }
}
enum roombutton_state {
    case avaliable
    case unavaliable
    case selected
}
enum sex_type : String{
    case male = "男"
    case famale = "女"
}
enum title_type : String{
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

struct oldStudent{
        var id: Int
        var name: String
        var sex: String
        var email: String
        var subjects: Int
        var enrollment: Int
        var birth: String
}
struct oldClass{
        var id: String
        var lecture: String
        var schedule: String
        var classroom: String
}
let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
var ex_blankuser_interface = UserInterface()
//var ex_student_interface = UserInterface(ID: "1234567890", password: "1234567890") as! StudentInterface
//var ex_teacher_interface = UserInterface(ID: "87654321", password: "87654321") as! TeacherInterface
//var ex_secretary_interface = UserInterface(ID: "123456", password: "123456") as! SecretaryInterface
var ex_student_interface = StudentInterface(ID: "1234567890", password: "1234567890")
var ex_teacher_interface = TeacherInterface(ID: "87654321", password: "87654321")
var ex_secretary_interface = SecretaryInterface(ID: "123456", password: "123456")
var ex_dean_interface = UserInterface(ID: "D1234", password: "D1234")
var ex_hr_interface = UserInterface(ID: "H1234", password: "H1234")
var ex_student_info = StudentInfo(name: "童川博", school: "地理与信息工程学院", enrollment: "2022", subject: "地理信息科学", email: "tongchuanbo@cug.edu.cn", sex: .male, birth: dateFormatter.date(from: "2003-11-17")!)
var ex_teacher_info = TeacherInfo(name: "郑坤", school: "地理与信息工程学院", enrollment: "2004", email: "ZhengK@cug.edu.cn", office: "地信楼-101", sex :.male , birth : dateFormatter.date(from: "1980-01-01")!, title: .associate_professor)
var ex_secretary_info = SecretaryInfo(name: "曾云", school: "地理与信息工程学院", enrollment: "2010", email: "zengyun@cug.edu.cn", sex : .famale, birth : dateFormatter.date(from: "1990-01-01")!)
var ex_student = Student(user: ex_student_interface)
var ex_teacher = Teacher(user: ex_teacher_interface)
var ex_secretary = Secretary(user: ex_secretary_interface)
