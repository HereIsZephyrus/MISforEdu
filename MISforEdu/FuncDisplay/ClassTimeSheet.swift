//
//  SelectDate.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct SelectWeekday: View {
    @State var isPresent : Bool = false
    @State var toCreate: Set<Int> = []
    
    var body: some View {
        Button (action : {isPresent = true}){
            Label("选择课程时间",systemImage: "checkmark.circle")
        }
        .sheet(isPresented: $isPresent){
            Weekview(isPresent:$isPresent,selectedOrder:$toCreate)
                .frame(width: 550,height: 700)
        }
    }
}

struct SelectDate_Previews: PreviewProvider {
    static var previews: some View {
        SelectWeekday()
    }
}

struct Weekview: View {
    @Binding var isPresent: Bool 
    @Binding var selectedOrder: Set<Int>
    @State var tempOrder : Set<Int> = []
    init(isPresent:Binding<Bool>,selectedOrder: Binding<Set<Int>>) {
            _selectedOrder = selectedOrder
            _isPresent = isPresent
            tempOrder = selectedOrder.wrappedValue
        }
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white)
                .frame(width: 550,height: 700)
                .shadow(radius: 5)
                .padding(10)
            VStack(alignment: .trailing) {
                VStack {
                    WeekdayHeader()
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.gray)
                            .opacity(0.2)
                            .frame(width: 450,height: 500,alignment: .top)
                            .padding(.top,-20)
                        HStack {
                            ForEach(0..<7){index_week in
                                VStack {
                                    ForEach(0..<12){index_class in
                                        Text(String(index_class+1))
                                            .font(.body)
                                            .frame(width: 30,height: 30)
                                            .background(Rectangle()
                                                .stroke(Color.black, lineWidth: 2)
                                                .background(tempOrder.contains(calcOrder(week: index_week, classNumber: index_class)) ? Color.blue : Color.clear))
                                                .frame(width: 30,height: 30)
                                                .padding(0)
                                                .padding(.horizontal,10)
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                if tempOrder.contains(calcOrder(week: index_week, classNumber: index_class)) {
                                                    tempOrder.remove(calcOrder(week: index_week, classNumber: index_class))}
                                                else {tempOrder.insert(calcOrder(week: index_week, classNumber: index_class))}
                                            }
                                    }
                                }.padding(.vertical,-10)
                            }
                        }
                    }
                }
                
                VStack {
                    Button(action :{
                        selectedOrder = tempOrder
                        dismiss()}){
                        Label("确认", systemImage: "checkmark.circle")
                    }.padding(5)
                    Button(action :{dismiss()}){
                        Label("返回", systemImage: "arrowshape.turn.up.left")
                    }
                }
            }
        }
    }
}

func calcOrder(week: Int, classNumber: Int) -> Int {
    let order = week * 12 + classNumber
    return order
}

struct WeekdayHeader: View {
    let weekday_name = ["一","二","三","四","五","六","日"]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.blue)
                .frame(width: 450,height: 50)
                .padding(10)
            HStack {
                ForEach(weekday_name, id: \.self) { weekday in
                    Text(weekday)
                        .frame(width: 30,height: 30)
                        .padding(.horizontal,10)
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}
