//
//  GradeManageView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct StudentGradeInfo {
    let name: String
    var scores: [Double]
}
struct GradeManageView: View {
    @State private var gradeSheets: [[StudentGradeInfo]]
    let lectureName : [String] //= ex_lecturelist_name
    let classID : [String] //=  ex_lecturelist_teacher
    let lectureNum : Int
    @State var finishCritic : [Bool]
    @State var index : Int = 0
    let sheetHeader : [String]
    //@State private var isGradeConfirmed = false
    //init(lectureList : [String], classList : [String], creditType : credit_type){
    init(classList : [ClassInfo], creditType : credit_type){
        self.lectureName = classList.map{($0.belongedLec.name)}
        self.classID = classList.map{($0.name)}
        self.lectureNum = classList.count
        self.finishCritic = Array(repeating: false, count: lectureNum)
        //let initscore = Array(repeating: 0.0, count: gradeSheetHeads[creditType]!.count)
        self.gradeSheets = Array(repeating: [
            StudentGradeInfo(name: "Alice", scores: [0.0, 0.0, 0.0]),
            StudentGradeInfo(name: "Bob", scores: [0.0, 0.0, 0.0]),
            StudentGradeInfo(name: "Charlie", scores: [0.0, 0.0, 0.0])]
                                 , count: lectureNum)
        self.sheetHeader = gradeSheetHeads[creditType]!
    }
    var body: some View {
        NavigationStack{
            VStack {
                ClassHeadInfo(lecture: lectureName[index], classID: classID[index])
                Divider()
                GradeSheet(sheetHeader : sheetHeader,gradeSheet: $gradeSheets[index],finishCritic: $finishCritic,index: index)
                //CriticSheet(questionList: teaching_critic_question,ratingSheet: $ratingtable[index])
                Divider()
                SheetNavigationBar(num: lectureNum, index: $index,SourseView: AccountView(interface: .constant(ex_teacher_interface)), confirmAction: confirmGrades, finishedSheet: $finishCritic)
                
                /*
                Button(action: confirmGrades) {
                    Text(isGradeConfirmed ? "" : "确认成绩")
                }
                .disabled(isGradeConfirmed)
                .padding()
                
                if isGradeConfirmed {
                    HStack{
                        Text("成绩已确认")
                            .foregroundColor(.green)
                            .padding()
                        Button {
                            isGradeConfirmed = false
                        } label: {
                            Text("取消")
                                .foregroundStyle(.pink)
                        }

                    }
                }*/
            }
        }.navigationTitle("成绩录入")
        .navigationBarBackButtonHidden(true)
    }
    func ClassHeadInfo (lecture : String, classID : String) -> some View{
        return HStack {
            Text("课程名称:\(lecture)")
                .frame(width: 500,alignment: .leading)
                .padding(5)
                .font(.title2)
            Text("班级:\(classID)")
                .frame(width: 200,alignment: .trailing)
                .padding(5)
                .font(.title2)
        }
    }
    func confirmGrades() -> Bool{
        //isGradeConfirmed = true
        return false
    }
}

struct GradeManageView_Previews: PreviewProvider {
    static var previews: some View {
        //GradeManageView(lectureList: ex_lecturelist_name, classList: ex_classlist_ID,creditType: .test)
        GradeManageView(classList: ex_class_info, creditType: .test)
    }
}

struct GradeSheet: View {
    let sheetHeader : [String]
    @Binding var gradeSheet : [StudentGradeInfo]
    @Binding var finishCritic : [Bool]
    let index : Int
    var body: some View {
        GeometryReader{ geometry in
            List {
                let col_num = sheetHeader.count
                let col_width = geometry.size.width  / CGFloat(col_num) - 30
                HStack (spacing:12){
                    ForEach(sheetHeader, id: \.self) { title in
                        HStack {
                            Text(title)
                            .padding(10)
                        } .frame(width: col_width)
                    }
                }.frame(width: geometry.size.width*0.9)
                .padding(.leading,10)
                ForEach(gradeSheet.indices, id: \.self) { studentindex in
                    HStack {
                        Text(gradeSheet[studentindex].name)
                            .font(.headline)
                        //.padding(.bottom, 8)
                            .frame(width: 150)
                        
                        HStack(spacing : 15) {
                            ForEach(gradeSheet[studentindex].scores.indices, id: \.self) { scoreIndex in
                                if finishCritic[index]{
                                    Text(String(floatFormatter.string(from: NSNumber(value: gradeSheet[scoreIndex].scores[scoreIndex]))!))
                                        .frame(width: col_width)
                                }
                                else{
                                    inputField(score: $gradeSheet[scoreIndex].scores[scoreIndex])
                                    .frame(width: col_width)
                                }
                            }
                        }
                    }
                }.frame(width: geometry.size.width*0.9)
            }.listStyle(.plain)
        }
    }
    
    func inputField(score : Binding<Double>) -> some View{
        return TextField("Score", text: Binding(
            get: {
                String(floatFormatter.string(from: NSNumber(value: score.wrappedValue))!)
            },
            set: {
                if let value = Double($0) {
                    score.wrappedValue = value
                }
            }
        ))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            .frame(width: 60)
    }
}
