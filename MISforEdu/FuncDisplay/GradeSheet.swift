//
//  GradeSheet.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI
/*
struct GradeSheet: View {
    let subject = "数据库与空间数据库"
        
    @State private var score: String = ""
    let data = [
            ["姓名", "班级","平时成绩", "考试成绩","总成绩"],
            ["童川博","0001", "80", "80","80"],
            ["童川博", "0001","80", "80","80"]
        ]
    var body: some View {
        VStack {
            Text("课程名称:\(subject)")
                .font(.largeTitle)
            GradeSheetView(data:data)
        }
    }
}

struct GradeSheet_Previews: PreviewProvider {
    static var previews: some View {
        GradeSheet()
    }
}

struct GradeSheetView: View {
    let data : [[String]]
    var body: some View {
        GeometryReader{ geometry in
                List {
                    ForEach(data, id: \.self) { row in
                        let col_num = row.count
                        let col_width = geometry.size.width  / CGFloat(col_num) - 30
                        HStack {
                            ForEach(row, id: \.self) { cell in
                                Text(cell)
                                    .frame(width: col_width)
                                    .padding(10)
                            }
                        }
                    }
                }
                .frame(height:geometry.size.height * 0.9)
        }
    }
}
*/
