//
//  ReviewCheck.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticCheckView: View {
    @Binding var  user : Teacher?
        @State private var studentIdToSearch: String = ""
        @State private var classIdToSearch: String = ""
        
        var body: some View {
            VStack {
                // 输入框和按钮用于查询某个同学不同课程的成绩
                HStack {
                    TextField("学生ID", text: $studentIdToSearch)
                        .padding()
                    Button(action: {
                        // 执行查询某个同学不同课程的成绩操作
                        searchStudentGrades()
                    }) {
                        Text("查询")
                    }
                }
                
                // 显示某个同学不同课程的成绩
                Text("学生 \(studentIdToSearch) 的成绩:")
                    .font(.headline)
                // 循环显示成绩信息
                ForEach(getStudentGrades(), id: \.self) { grade in
                    Text(grade)
                }
                
                // 输入框和按钮用于查询班级平均分
                HStack {
                    TextField("班级ID", text: $classIdToSearch)
                        .padding()
                    Button(action: {
                        // 执行查询班级平均分操作
                        searchClassAverage()
                    }) {
                        Text("查询")
                    }
                }
                
                // 显示班级平均分
                Text("班级 \(classIdToSearch) 的平均分:")
                    .font(.headline)
                
                // 显示班级平均分结果
                Text(getClassAverage())
            }
            .padding()
        }
        
        // 查询某个同学不同课程的成绩
        func searchStudentGrades() {
            // 执行查询操作
            // ...
        }
        
        // 获取某个同学不同课程的成绩
        func getStudentGrades() -> [String] {
            // 返回某个同学不同课程的成绩
            // ...
            return [""]
        }
        
        // 查询班级平均分
        func searchClassAverage() {
            // 执行查询操作
            // ...
        }
        
        // 获取班级平均分
        func getClassAverage() -> String {
            // 返回班级平均分
            // ...
            return ""
        }
}

struct CriticCheck_Previews: PreviewProvider {
    static var previews: some View {
        CriticCheckView(user : .constant(ex_teacher))
    }
}
