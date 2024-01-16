//
//  AttendSheet.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI

struct RadioButton: View {
    @Binding var selected: String?
    let option: String
    
    var body: some View {
        Image(systemName: selected == option ? "largecircle.fill.circle" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.blue)
            .onTapGesture {
                selected = option
            }
    }
}

struct AttendSheet: View {
    @State private var selectedOptions: Set<String> = []
        
        let options = ["Option 1", "Option 2", "Option 3"]
        
        var body: some View {
            NavigationStack {
                        List {
                            ForEach(options, id: \.self) { option in
                                HStack {
                                    CheckboxButton(selectedOptions: $selectedOptions, option: option)
                                        .padding()
                                    Text(option)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: Text("Detail View for \(option)")) {
                                        Text("课程详情")
                                            .foregroundColor(.blue)
                                            
                                    }
                                    .frame(width: 100,alignment: .trailing)
                                }
                                .contentShape(Rectangle())
                                }
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                       .navigationTitle("课程列表")
                  }
        }

struct AttendSheet_Previews: PreviewProvider {
    static var previews: some View {
        AttendSheet()
    }
}
