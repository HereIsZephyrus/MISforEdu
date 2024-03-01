//
//  ClassManageTable.swift
//  MISforEdu
//
//  Created by ChanningTong on 2/10/24.
//

import SwiftUI

struct LectureSelectSheet: View {
    @Binding var selectedRow: Int?
    let data : [String]
    var body: some View {
        VStack {
            Text("选择待安排的课程名")
                .font(.title)
            FilterBarProcessor(displayType: .dot, filter: FilterView(filter: Filters().PersonFilterItem))
            List(selection: $selectedRow) {
                ForEach(0..<data.count, id: \.self) { index in
                    Text(data[index])
                }
            }
            .listStyle(.plain)
            .frame(height: 300)
        }
    }
}

struct ClassManageSheet: View {
    let coursename : String
    @State private var notes: String = ""
    @State var ArrangedInfo : String = "显示已安排好的课程信息"
    var body: some View {
        VStack {
            Text(coursename)
                .font(.title)
            
            VStack(alignment : .trailing) {
                ArrangeClassTime()
                HStack {
                    TextField("课程备注", text: $notes)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .frame(width: 250,height: 60)
                    ArrangeClassInstructor()
                    ArrangeClassRoom()
                }
            }
            
            Text(ArrangedInfo)
        }
    }
}

struct ArrangeClassTime: View {
    @State var toCreate: Set<Int> = []
    @State var isPresent : Bool = false
    @State var first_week : Int = 1
    @State var last_week : Int = 20 + 1
    var body: some View {
        HStack(spacing : 20) {
            SetClassDuringTime(isFirstWeek: true, first_week: $first_week, last_week: $last_week)
            SetClassDuringTime(isFirstWeek: false, first_week: $first_week, last_week: $last_week)
            Button(action: {
                isPresent = true
            }) {
                Text("选择上课时间")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isPresent){
                Weekview(isPresent:$isPresent,selectedOrder:$toCreate)
                    .frame(width: 550,height: 700)
            }
        }
    }
}

struct ArrangeClassRoom: View {
    @State var isPresent : Bool = false
    var body: some View {
        Button(action: {
            isPresent = true
        }) {
            Text("选择上课教室")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .sheet(isPresented: $isPresent) {
            ClassRoomSheet(isPresent: $isPresent)
        }
    }
}

struct ArrangeClassInstructor: View {
    @State var isPresent : Bool = false
    var body: some View {
        Button(action: {
            isPresent = true
        }) {
            Text("选择上课教师")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .sheet(isPresented: $isPresent) {
            PersonCheckView()//(isPresent: $isPresent)
        }
    }
}

struct SetClassDuringTime: View {
    let isFirstWeek : Bool
    @Binding var first_week : Int
    @Binding var last_week : Int
    var body: some View {
        let displayType = isFirstWeek ? "起始周" : "结束周"
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary)
                .frame(width: 175,height: 55)
            HStack {
                Text(displayType)
                if (isFirstWeek){
                Picker("周数", selection: $first_week) {
                    ForEach(1 ..< last_week, id: \.self){ num in
                        Text("第\(num)周")
                    }
                }.pickerStyle(MenuPickerStyle())
                }
                else{
                    Picker("周数", selection: $last_week) {
                        ForEach(first_week ..< 21, id: \.self){ num in
                            Text("第\(num)周")
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
            }
        }
    }
}
