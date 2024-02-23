//
//  GradesInfo.swift
//  MISforEdu
//
//  Created by ChanningTong on 2/23/24.
//

import Foundation
let gradeSheetHeads : [credit_type:[String]] = [
    .test : ["姓名","平时成绩", "考试成绩","总成绩"],
    .exam : ["姓名","平时成绩", "考核成绩","总成绩"],
    .none : ["姓名","总成绩"]
]
let gradeMulti : [lecture_type : Float] = [.basic : 1.5, .elective : 1.2, .restricted : 1.0]
