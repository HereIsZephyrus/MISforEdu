//
//  PersonCheckView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct PersonCheckView: View{
    let select_students = [
        Student(id: 20221000679, name: "童川博", sex: "男", email: "john@example.com", subjects: 4, enrollment: 2022, birth: "1995-03-15"),
        Student(id: 20211000680, name: "相泽林", sex: "男", email: "jane@example.com", subjects: 5, enrollment: 2021, birth: "1998-08-21"),
        Student(id: 20231000681, name: "姚慧杰", sex: "男", email: "alex@example.com", subjects: 3, enrollment: 2023, birth: "2000-11-07")
    ]
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ScrollView( .vertical,content: {
                    ForEach(0..<3){index in
                        NavigationLink(destination: AccountManageView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.white)
                                    .frame(width: geometry.size.width*0.7,height: 50)
                                    .shadow(radius: 5)
                                    .padding(10)
                                VStack(alignment: .leading) {
                                    Text("""
    \(String(select_students[index].id))\
    \(select_students[index].name)\
    \(select_students[index].sex)\
    地理与信息工程学院\
    \(String(select_students[index].enrollment))入学
""").font(.body)
                                }.padding(10)
                            }
                        }
                        
                    }
                })
            }
        }
        }
}

struct PersonCheckView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCheckView()
    }
}
