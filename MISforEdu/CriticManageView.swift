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
    var  next_index = 0
    @State var index : Int = 0
    @State  var finishCritic : [Bool]
    @State var allFinished : Bool
    @State var ratingtable : [[Int]]
    init(lectureList : [String], teacherList : [String]){
        self.lectureName = lectureList
        self.teacherName = teacherList
        self.lectureNum = lectureList.count
        self.finishCritic = Array(repeating: false, count: lectureNum)
        self.allFinished = false
        self.ratingtable = Array(repeating: Array(repeating: 0, count: questionList.count), count: lectureList.count)
    }
    var body: some View{
        NavigationStack{
            VStack {
                LectureHeadInfo(lecture: lectureName[index], teacher: teacherName[index])
                Divider()
                CriticSheet(questionList: teaching_critic_question,ratingSheet: $ratingtable[index])
                Divider()
                HStack {
                    NavigationLink {
                        AccountView(interface: .constant(ex_student_interface))
                    } label: {
                        NavigationTextStyle(content: next_index == lectureNum ? "完成" : "返回")
                    }

                    Button{
                        index -= 1
                    }label: {
                        NavigationTextStyle(content: "上一页")
                    }.disabled(index <= 0)
                    
                    Button{
                        index += 1
                    }label: {
                        NavigationTextStyle(content: "下一页")
                    }.disabled(index >= lectureNum - 1)
                    
                    Button{
                        finishCritic[index] = true
                        let  next_index = FindNextCritic(stateList : finishCritic)
                        if (next_index == lectureNum){
                            allFinished = true
                        }
                        else{
                            index = next_index
                        }
                        //print(finishCritic)
                        //print(allFinished)
                        //print(next_index)
                    } label: {
                        NavigationTextStyle(content: "提交")
                    }.alert(isPresented: $allFinished, content: {
                        Alert(title: Text("已完成全部评价"))
                    })
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("课程评价")
        }
      
    }
    func FindNextCritic(stateList : [Bool]) -> Int{
        for (index,finished) in stateList.enumerated(){
            if (finished == false){
                return index
            }
        }
        return stateList.endIndex
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
    func NavigationTextStyle(content : String) -> some View{
        return Text("\(content)")
            .foregroundStyle(.white)
            .font(.title2)
            .padding(7)
            .background(
                RoundedRectangle(cornerRadius: 10)
            )
    }
}

struct CriticView_Previews: PreviewProvider {
    static var previews: some View {
        CriticManageView(lectureList: ex_lecturelist_name, teacherList: ex_lecturelist_teacher)
    }
}
