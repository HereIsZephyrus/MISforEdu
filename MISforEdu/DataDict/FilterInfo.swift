//
//  FilterInfo.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import Foundation

let schoolList = {
    let list = SchoolInfoDisplay(filter: Filter()).Fatch()
    return list.map{($0.name)}
}()
let subjectList = {
    let list = SubjectInfoDisplay(filter: Filter()).Fatch()
    return list.map{($0.name)}
}()
let enrollmentList = {
    let currentYear = Calendar.current.component(.year, from: Date())
    let list = Array(stride(from: currentYear - 15, through: currentYear, by: 1))
    return list.map {String($0)}
}()
let semesterList = {
    let currentYear = Calendar.current.component(.year, from: Date())
    var list : [String] = []
    for year in currentYear - 5...currentYear {
        let firstSemester = "\(year)学院第一学期"
        let secondSemester = "\(year)学院第二学期"
        list.append(firstSemester)
        list.append(secondSemester)
    }
    return list
}()
let lectureTypeList = {
    var list : [String] = []
    for cate in lecture_type.allCases{
        list.append(cate.rawValue)
    }
    return list
}()
let AssessmentTypeList = {
    var list : [String] = []
    for cate in credit_type.allCases{
        list.append(cate.rawValue)
    }
    return list
}()
let creditList = Array(stride(from: 1.0, through: 5.0, by: 0.5)).map {String($0)}
let weekdayList = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]

struct Filters{
    let PersonFilterItem = FilterItem(
    title: ["学院","专业","入学年份","姓名","学号"],
    inputType: [.option,.option,.option,.textfill,.textfill],
    predicate: [["是"],["是"],["是","早于","晚于"],["是","包含"],["是"]],
    item: [
        schoolList,
        subjectList,
        enrollmentList
    ])
    let GradeFilterItem = FilterItem(
    title: ["学期","课程类别","学分","开课学院"],
    inputType: [.option,.option,.option,.option],
    predicate: [["是","早于","晚于"],["是","不是"],["是","大于","小于"],["是"]],
    item: [
        semesterList,
        lectureTypeList,
        creditList,
        schoolList
    ])
    let LectureFilterItem = FilterItem(
    title: ["课程类别","考核方式","学分","开课学院","上课时间","授课老师"],
    inputType: [.option,.option,.option,.option,.option,.textfill],
    predicate: [["是"],["是"],["是","大于","小于"],["是"],["是","包含","不包含"],["是"]],
    item: [
        lectureTypeList,
        AssessmentTypeList,
        creditList,
        schoolList,
        weekdayList
    ])
}

