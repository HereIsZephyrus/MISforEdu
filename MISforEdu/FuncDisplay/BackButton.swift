//
//  BackButton.swift
//  MISforEdu
//
//  Created by ChanningTong on 2/10/24.
//

import SwiftUI

struct BackButton: View {
    let label: String
    @Binding var isPresent : Bool
    var body: some View {
        Button(action: {
            isPresent.toggle()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(label: "返回", isPresent: .constant(true))
    }
}
