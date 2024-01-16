//
//  CheckButton.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI


struct CheckboxButton: View {
    @Binding var selectedOptions: Set<String>
    let option: String
    
    var body: some View {
        Image(systemName: selectedOptions.contains(option) ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.blue)
            .onTapGesture {
                if selectedOptions.contains(option) {
                    selectedOptions.remove(option)
                } else {
                    selectedOptions.insert(option)
                }
            }
    }
}
