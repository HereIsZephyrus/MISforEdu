//
//  BasicView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/16/24.
//

import SwiftUI

struct StudentView: View {
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
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.orange)
                            .frame(width: geometry.size.width - 200,height:70)
                            .padding(.vertical,10)
                        HStack(alignment: .center,spacing: 60){
                            HStack(spacing:20){
                                Text("学号:")
                                    .font(.title2)
                                Text("20221000679")
                            }
                                //.background()
                            HStack(spacing:20){
                                Text("学院:")
                                    .font(.title2)
                                Text("地理与信息工程学院")
                            }
                        }
                    }.padding(.top,20)
                    
                    Form {
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("信息管理")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("课表查看")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("成绩查询")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("教学评价")
                            }
                        }
                        Section {
                            NavigationLink(destination: Text("Profile Info")) {
                                Text("选课系统")
                            }
                        }
                    }
                }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .navigationBarTitle("Settings")
         }
        }
    }
 }


struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentView()
    }
}
