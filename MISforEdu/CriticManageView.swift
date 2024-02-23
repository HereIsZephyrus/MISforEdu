//
//  CriticView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticManageView: View {
    let questionList = teaching_critic_question
    //let questionList
    let lectureName : [String] //= ex_lecturelist_name
    let teacherName : [String] //=  ex_lecturelist_teacher
    let lectureNum : Int
    @State var finishCritic : [Bool]
    @State var index : Int = 0
    @State var ratingtable : [[Int]]
    init(lectureList : [String], teacherList : [String]){
        self.lectureName = lectureList
        self.teacherName = teacherList
        self.lectureNum = lectureList.count
        self.finishCritic = Array(repeating: false, count: lectureNum)
        self.ratingtable = Array(repeating: Array(repeating: 0, count: questionList.count), count: lectureList.count)
    }
    var body: some View{
        NavigationStack{
            VStack {
                LectureHeadInfo(lecture: lectureName[index], teacher: teacherName[index])
                Divider()
                CriticSheet(questionList: teaching_critic_question,ratingSheet: $ratingtable[index])
                Divider()
                SheetNavigationBar(num: lectureNum, index: $index, SourseView: AccountView(interface: .constant(ex_student_interface)), confirmAction: confirmCritic, finishedSheet: $finishCritic)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("课程评价")
        }
      
    }
    func confirmCritic(){
        
    }
    func LectureHeadInfo (lecture : String, teacher : String) -> some View{
        return HStack {
            Text("课程名称:\(lecture)")
                .frame(width: 500,alignment: .leading)
                .padding(5)
                .font(.title2)
            Text("教师:\(teacher)")
                .frame(width: 200,alignment: .trailing)
                .padding(5)
                .font(.title2)
        }
    }
}

struct CriticView_Previews: PreviewProvider {
    static var previews: some View {
        CriticManageView(lectureList: ex_lecturelist_name, teacherList: ex_lecturelist_teacher)
    }
}
