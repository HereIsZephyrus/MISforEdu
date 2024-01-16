//
//  LoadingView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI

struct Loading: View {
    var body: some View {
            VStack {
                Text("Loading...")
                    .font(.title)
                    .foregroundColor(.gray)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
} 

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
