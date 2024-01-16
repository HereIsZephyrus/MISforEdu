//
//  GradeEdit.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI

struct GradeEdit: View {
    let className = "数据库与空间数据库-001"
    
@State private var errorMessage: String = ""
@State private var successMessage: String = ""
let name = ["童川博","tcb"]
let head =  ["姓名", "班级","平时成绩", "考试成绩","总成绩"]
var body: some View {
    GeometryReader { geo in
        VStack {
            Text("教学班级:\(className)")
                .font(.largeTitle)
            GradeEditView(head:head,names : name)
                .frame(height: geo.size.height * 0.8)
            HStack {
                Button(action: {
                            saveScore()
                        }) {
                            Text("保存")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    .padding()
                Button(action: {
                            saveScore()
                        }) {
                            Text("保存")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    .padding()
            }
        }
    }
}
    
    func saveScore() {
        //guard Int(score) >= 0 && Int(score) <= 100 else {
      //              print("无效的成绩")
      //              return
        //        }
        successMessage = "成绩保存成功"
        errorMessage = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    successMessage = ""
                }
    }
        
}

struct GradeEdit_Previews: PreviewProvider {
    static var previews: some View {
        GradeEdit()
    }
}


struct GradeEditView: View {
    let head : [String]
    let names : [String]
    @State var score : String = ""
    var body: some View {
        GeometryReader{ geometry in
            List {
                let col_num = head.count
                let col_width = geometry.size.width  / CGFloat(col_num) - 30
                HStack (spacing:12){
                    ForEach(head, id: \.self) { title in
                        HStack {
                            Text(title)
                            .padding(10)
                        } .frame(width: col_width)
                    }
                }.frame(width: geometry.size.width*0.9)
                    .padding(.leading,10)
                VStack {
                    ForEach(names, id: \.self) { name in
                        HStack {
                            Text(name)
                                .frame(width: col_width)
                                .padding()
                            
                        ForEach(1..<col_num){index in
                            HStack {
                                TextField("",text:$score)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(width: 70)
                                                .padding(.horizontal)
                                            .keyboardType(.decimalPad)
                            }.frame(width: col_width)
                        }
                        }.frame(width: geometry.size.width*0.9)
                        
                    }
                }
            }
            .frame(height:geometry.size.height * 0.9)
        }
        //.ignoresSafeArea(.all)
    }
}
