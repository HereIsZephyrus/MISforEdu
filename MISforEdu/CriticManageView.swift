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
    let lectureName : [String]
    let teacherName : [String]
    let lectureNum : Int
    @State var finishCritic : [Bool]
    @State var index : Int = 0
    @State var ratingtable : [[Int]]
    init(lectureList : [ClassInfo]){
        self.lectureName = lectureList.map{$0.belongedLec.name}
        self.teacherName = lectureList.map{$0.instructor}
        self.lectureNum = lectureList.count
        self.finishCritic = Array(repeating: false, count: lectureNum)
        self.ratingtable = Array(repeating: Array(repeating: 0, count: questionList.count), count: lectureList.count)
    }
    init (user : Student){
        let classes = CriticListDisplay(filter: Filter())
        classes.setElements(elements: classes.Fatch())
        (self.lectureName,self.teacherName) = classes.mapToTitle()
        self.lectureNum = classes.getElements().count
        self.finishCritic = Array(repeating: false, count: lectureNum)
        self.ratingtable = Array(repeating: Array(repeating: 0, count: questionList.count), count: classes.getElements().count)
    }
    var body: some View{
        NavigationStack{
            VStack {
                LectureHeadInfo(lecture: lectureName[index], teacher: teacherName[index])
                Divider()
                CriticSheet(questionList: teaching_critic_question,ratingSheet: $ratingtable[index], editable: finishCritic[index])
                Divider()
                SheetNavigationBar(num: lectureNum, index: $index, SourseView: AccountView(interface: .constant(ex_student_interface)), confirmAction: confirmCritic, finishedSheet: $finishCritic)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("课程评价")
        }
      
    }
    func confirmCritic() -> Bool{
        var totalStar : Int = 0
        let singleItemScore : Float = 20.0 / Float(ratingtable[index].count)
        for score in ratingtable[index]{
            if (score == 0){
                return true
            }
            else{
                totalStar += score
            }
        }
        PushScore()
        return false
        func PushScore(){
            print(ratingtable[index])
            print(Float(totalStar) * singleItemScore)
            print("Score Pushed")
        }
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
        //CriticManageView(lectureList: ex_lecturelist_name, teacherList: ex_lecturelist_teacher)
        CriticManageView(user : ex_student)
    }
}
