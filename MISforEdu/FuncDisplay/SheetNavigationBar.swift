//
//  SheetNavigationBar.swift
//  MISforEdu
//
//  Created by ChanningTong on 2/23/24.
//

import SwiftUI

struct SheetNavigationBar: View {
    let num : Int
    @Binding var index : Int
    let SourseView : AccountView
    let confirmAction : () -> Bool
    @Binding var finishedSheet : [Bool]
    @State var showAlert : Bool = false
    @State var allFinished : Bool = false
    var next_index = 0
    var body: some View {
        HStack {
            NavigationLink {
                //AccountView(interface: .constant(ex_student_interface))
                SourseView
            } label: {
                NavigationTextStyle(content: next_index == num ? "完成" : "返回")
            }
            
            Button{
                index -= 1
                showAlert = false
            }label: {
                NavigationTextStyle(content: "上一页")
            }.disabled(index <= 0)
            
            Button{
                index += 1
                showAlert = false
            }label: {
                NavigationTextStyle(content: "下一页")
            }.disabled(index >= num - 1)
            
            Button{
                showAlert = confirmAction()
                if (showAlert == false){
                    finishedSheet[index].toggle()
                    let  next_index = FindNextCritic(stateList : finishedSheet)
                    if (next_index == num){
                        allFinished = true
                    }
                    else{
                        index = next_index
                    }
                }
            } label: {
                NavigationTextStyle(content: finishedSheet[index] ? "修改" : "提交")
            }.alert(isPresented: $allFinished, content: { Alert(title: Text("已完成全部评价")) })
                .alert(isPresented: $showAlert, content: { Alert(title: Text("请完成每一项评价")) })
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
    func FindNextCritic(stateList : [Bool]) -> Int{
        for (index,finished) in stateList.enumerated(){
            if (finished == false){
                return index
            }
        }
        return stateList.endIndex
    }
}
