//
//  SyllabusView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct SyllabusView: View {
        var body: some View {
            NavigationStack {
                    VStack {
                        SyllabusListView()
                        SyllabusTableView()
                    }
                .navigationTitle("个人课表查询")
            }
        }
}

struct SyllabusView_Previews: PreviewProvider {
    static var previews: some View {
        SyllabusView()
    }
}

struct SyllabusTableView: View {
    let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        let classes = [
            ["数据库", "数据库", "", "数据库", "", "", ""],
            ["", "", "", "", "", "数据库", ""],
            ["", "数据库", "", "", "数据库", "", ""],
            ["", "", "数据库", "", "", "", "数据库"],
            ["", "", "", "", "数据库", "", ""],
            ["", "", "", "", "", "", ""],
            ["", "", "", "", "", "", ""]
        ]
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: weekdays.count), spacing: 10) {
            ForEach(0..<weekdays.count) { column in
                VStack {
                    Text(weekdays[column])
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<classes.count) { row in
                        Text(classes[row][column])
                            .padding()
                            .frame(width: 120,height: 70,alignment: .center)
                            .border(Color.gray)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
    }
}

struct SyllabusListView: View {
    let classlist: [oldClass] = [
            oldClass(id: "1库", lecture: "数据库与空间数据库", schedule: "8:30-22:30", classroom: "教室A"),
            oldClass(id: "2", lecture: "数据库与空间数据库", schedule: "8:30-22:30", classroom: "教室B"),
            oldClass(id: "3", lecture: "数据库与空间数据库", schedule: "8:30-22:30", classroom: "教室C"),
            oldClass(id: "4", lecture: "数据库与空间数据库", schedule: "8:30-22:30", classroom: "教室D"),
            oldClass(id: "5", lecture: "数据库与空间数据库", schedule: "8:30-22:30", classroom: "教室E")
        ]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        GeometryReader{geo in
            HStack (alignment: .top){
                VStack {
                    Text("今日课表")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(width: 100,height: 100)
                        .background(.blue)
                        .cornerRadius(25.0)
                }.frame(width: geo.size.width*0.2,alignment: .leading)
                .padding(.leading,-80)
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 40,
                    content: {
                        //.frame(width: geo.size.width,alignment: .leading)
                        ForEach(classlist.indices, id: \.self) { index in
                            VStack(alignment: .leading) {
                                Text(classlist[index].lecture)
                                    .font(.headline)
                                Text("课程时间: \(classlist[index].schedule)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("上课教室: \(classlist[index].classroom)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }.frame(width: geo.size.width*0.4,alignment: .center)
                        }
                    })
            }.frame(width: geo.size.width,alignment: .center)
        }
    }
}
