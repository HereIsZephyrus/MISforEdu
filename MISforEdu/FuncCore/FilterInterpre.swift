//
//  FilterInterpre.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import Foundation
/*
 struct Student {
     let id: Int
     let name: String
     let sex: String
     let email: String
     let subjects: Int
     let enrollment: Int
     let birth: String
 }

 struct StudentFilter {
     var filterId: Int?
     var filterName: String?
     var filterSex: String?
     var filterEmail: String?
     var filterSubjects: Int?
     var filterEnrollment: Int?
     var filterBirth: String?
     
     func filter(_ students: [Student]) -> [Student] {
         var filteredStudents = students
         
         if let id = filterId {
             filteredStudents = filteredStudents.filter { $0.id == id }
         }
         
         if let name = filterName {
             filteredStudents = filteredStudents.filter { $0.name == name }
         }
         
         if let sex = filterSex {
             filteredStudents = filteredStudents.filter { $0.sex == sex }
         }
         
         if let email = filterEmail {
             filteredStudents = filteredStudents.filter { $0.email == email }
         }
         
         if let subjects = filterSubjects {
             filteredStudents = filteredStudents.filter { $0.subjects == subjects }
         }
         
         if let enrollment = filterEnrollment {
             filteredStudents = filteredStudents.filter { $0.enrollment == enrollment }
         }
         
         if let birth = filterBirth {
             filteredStudents = filteredStudents.filter { $0.birth == birth }
         }
         
         return filteredStudents
     }
     
     // 添加对 Int 类型属性的大小比较方法
     func filterByIntProperty<T: Comparable>(_ keyPath: KeyPath<Student, T>, minValue: T?, maxValue: T?) -> StudentFilter {
         var newFilter = self
         
         if let minValue = minValue {
             newFilter.filterId = nil
             newFilter.filterName = nil
             newFilter.filterSex = nil
             newFilter.filterEmail = nil
             newFilter.filterSubjects = nil
             newFilter.filterEnrollment = nil
             newFilter.filterBirth = nil
             
             newFilter.filterSubjects = Int.min
             newFilter.filterEnrollment = Int.min
             
             newFilter.filter { student in
                 student[keyPath: keyPath] >= minValue
             }
         }
         
         if let maxValue = maxValue {
             newFilter.filterId = nil
             newFilter.filterName = nil
             newFilter.filterSex = nil
             newFilter.filterEmail = nil
             newFilter.filterSubjects = nil
             newFilter.filterEnrollment = nil
             newFilter.filterBirth = nil
             
             newFilter.filterSubjects = Int.max
             newFilter.filterEnrollment = Int.max
             
             newFilter.filter { student in
                 student[keyPath: keyPath] <= maxValue
             }
         }
         
         return newFilter
     }
 }

 // 示例用法
 let students = [
     Student(id: 1, name: "John", sex: "male", email: "john@example.com", subjects: 3, enrollment: 2020, birth: "1995-05-10"),
     Student(id: 2, name: "Alice", sex: "female", email: "alice@example.com", subjects: 2, enrollment: 2021, birth: "1998-09-15"),
     Student(id: 3, name: "Bob", sex: "male", email: "bob@example.com", subjects: 1, enrollment: 2019, birth: "1994-02-28")
 ]

 let filter = StudentFilter()
     .filterByIntProperty(\.subjects, minValue: 2, maxValue: 4)
     .filterByIntProperty(\.enrollment, minValue: 2020, maxValue: 2022)

 let filteredStudents = filter.filter(students)

 print(filteredStudents)
 */

