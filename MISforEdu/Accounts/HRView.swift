//
//  HRView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/16/24.
//

import SwiftUI

struct HRView: View {
    @State var notificationToggle: Bool = false
    @State var locationUsage: Bool = false
    @State var username: String = "tcb"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:15) {
                Image("italy")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                Text(username)
                    .font(.system(size: 40))
                VStack{
                    
                    Form {
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("信息查询")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("评价查询")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("信息管理")
                            }
                        }
                    }
                }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .navigationBarTitle("Settings")
         }
        }
    }
}

struct HRView_Previews: PreviewProvider {
    static var previews: some View {
        HRView()
    }
}
