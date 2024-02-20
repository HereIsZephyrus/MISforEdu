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
enum roombutton_state{
    case avaliable //= "空余"
    case unavaliable //= "占用"
    case selected //= "选中"
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
enum credit_type : String{
    case test
    case exam
    case none
}
enum lecture_type : String{
    case basic
    case restricted
    case elective
}
enum injection_type{
    case update
    case insert
    case delete
    case select
    case other
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
struct oldCourse {
    let name: String
    let grade: String
    let credit: Double
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