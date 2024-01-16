//
//  ClassManageView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI
import MapKit

struct ClassManageView: View {
    var body: some View {
        GeometryReader{geometry in
            VStack {
                //LectureArrangeView(geo: geometry)
                ClassArrangeView(geo: geometry)
            }
        }
    }
        
}


struct ClassManageView_Previews: PreviewProvider {
    static var previews: some View {
        ClassManageView()
    }
}

struct ClassArrangeView: View {
    let geo : GeometryProxy
    //let filter : Filter
    @State var currentIsDetailing = false
    @State var selectedRow: Int? = nil
    let data = ["数据库1", "数据库2", "数据库3", "数据库4", "数据库5"]
    var body: some View {
        @State var NavigationButton_name = currentIsDetailing ? "上一步" : "下一步"
        VStack {
            TabView(selection: $currentIsDetailing) {
                LectureSelectSheet(selectedRow: $selectedRow,data: data)
                    .tag(false)
                    .frame(width: geo.size.width * 0.9,height: geo.size.height * 0.5)
                
                ClassManageSheet(coursename : data[selectedRow ?? 0])
                    .tag(true)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: geo.size.width * 0.9,height: geo.size.height * 0.4)
            HStack {
                Spacer()
                
                Button("完成") {
                    currentIsDetailing.toggle()
                    selectedRow = nil
                }
                .padding()
                .opacity(currentIsDetailing ? 1 : 0)
                
                Button(NavigationButton_name) {
                    if let selectedRow = selectedRow {
                        // 处理选中的行数据，例如导航到下一个界面
                        currentIsDetailing.toggle()
                        print("选中的行数据: \(data[selectedRow])")
                    }
                }
                .padding()
                .disabled(selectedRow == nil)
            }
            .padding()
        }
    }
}

