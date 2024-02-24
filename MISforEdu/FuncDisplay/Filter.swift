//
//  Filters.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//
import SwiftUI

struct FilterView: View {
    @State private var selectedFilterID = 0
    @State private var selectedPredicate = "是"
    @State private var selectedOption = "地理与信息工程学院"
    @State private var filterString = ""
    //let filter : FilterItem = PersonFilterItem
    let filter : FilterItem
    var body: some View {
        ZStack {
            Capsule()
                .stroke(Color.primary)
                .frame(width: 300,height: 60)
            HStack(spacing:0) {
                Picker("筛选器类型", selection: $selectedFilterID) {
                    ForEach(0..<filter.num, id: \.self) { titleID in
                        Text(filter.title[titleID])
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 100)
                
                switch filter.inputType[selectedFilterID]{
                case .option: do{
                    Picker("筛选谓词", selection: $selectedPredicate) {
                        ForEach(filter.predicate[selectedFilterID], id: \.self) { predicate in
                            Text(predicate)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    //.frame(width: 10)
                    Picker("筛选项", selection: $selectedOption) {
                        ForEach(filter.item[selectedFilterID], id: \.self) { item in
                            Text(item)
                        }
                    }
                    .frame(width: 150)
                    //.padding(.vertical)
                }
                    
                case .textfill: do{
                    Picker("筛选谓词", selection: $selectedPredicate) {
                        ForEach(filter.predicate[selectedFilterID], id: \.self) { predicate in
                            Text(predicate)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    TextField("筛选项", text: $filterString)
                        .frame(width: 150)
                }
                }
            }
        }
    }
}
struct Filters_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filter : Filters().PersonFilterItem)
        FilterView(filter : Filters().GradeFilterItem)
        FilterView(filter : Filters().LectureFilterItem)
    }
}
