//
//  DeanView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/16/24.
//

import SwiftUI

struct DeanView: View {
    @State var notificationToggle: Bool = false
    @State var locationUsage: Bool = false
    @State var username: String = "tcb"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:15) {
                Image("portarit")
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
                                Text("课程管理")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("选课管理")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("教学班管理")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("成绩管理")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("评价查询")
                            }
                        }
                    }
                }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .navigationBarTitle("Settings")
         }
        }
    }
}

struct DeanView_Previews: PreviewProvider {
    static var previews: some View {
        DeanView()
    }
}
