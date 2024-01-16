//
//  CriticView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticManageView: View {
    @Binding var isFirst : Bool
    var lecture_name = "数据库与空间数据库"
    var teacher_name = "郑坤"
    var body: some View{
        NavigationStack{
            VStack {
                HStack {
                    Text("课程名称:\(lecture_name)")
                        .frame(width: 500,alignment: .leading)
                        .padding(5)
                        .font(.title2)
                    Text("教师:\(teacher_name)")
                        .frame(width: 200,alignment: .trailing)
                        .padding(5)
                        .font(.title2)
                }
                Divider()
                CriticSheet()
                Divider()
                HStack {
                    NavigationLink("返回", destination: CriticManageView(isFirst: .constant(false)))
                        .buttonStyle(.borderedProminent)
                    NavigationLink("上一页", destination: CriticManageView(isFirst: .constant(false)))
                        .buttonStyle(.borderedProminent)
                    NavigationLink("下一页", destination: CriticManageView(isFirst:
                        .constant(false)))
                        .buttonStyle(.borderedProminent)
                    NavigationLink("完成", destination: CriticManageView(isFirst: .constant(false)))
                        .buttonStyle(.borderedProminent)
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(!isFirst)
            .navigationTitle("课程评价")
        }
    }
}

struct CriticView_Previews: PreviewProvider {
    static var previews: some View {
        CriticManageView(isFirst: .constant(true))
    }
}
