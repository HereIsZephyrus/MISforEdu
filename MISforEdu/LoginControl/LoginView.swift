//
//  LoginView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/16/24.
//

import SwiftUI

//class UserSettings: ObservableObject {
//    @Published var loggedIn = TRUE
//}

struct LoginView: View {
    //@EnvironmentObject var settings: UserSettings
    
    @State  private var emailAddress: String = ""
    @State  private var password: String = ""
    
    var body: some View {
    GeometryReader { geometry in
            VStack (alignment: .center){
                Image("CUG_title")
                .resizable()
                .frame(width: 400, height: 110)
                .scaledToFit()
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                Text("一站式教学管理系统")
                    .font(.largeTitle)
                    .padding(.vertical, 50)
                
                ZStack(alignment: .bottom){
                    Image("background_login")
                        .resizable()
                        .scaledToFit()
                        //.frame(height: 350)
                        //.padding(10)
                    VStack{
                        
                        TextField("学号/职工号", text: self.$emailAddress)
                            .frame(width: geometry.size.width - 400, height: 50)
                            .textContentType(.emailAddress)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.red)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                        
                        
                        TextField("密码", text: self.$password)
                            .frame(width: geometry.size.width - 400, height: 50)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .foregroundColor(.gray)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .textContentType(.password)
                            .cornerRadius(5)
                            .padding(.bottom,40)
                        }
                }
                
                
                Divider()
                
                Button(action: {
                   //self.settings.loggedIn = true
                }) {
                       HStack {
                           Text("Log In")
                       }
                           .padding()
                           .frame(width: geometry.size.width - 190, height: 40)
                           .foregroundColor(Color.white)
                           .background(Color.blue)
                           .cornerRadius(5)
                   }
                    .padding(.bottom)
                Button(action: {
                        print("Take to forget password VC")
                        }) {
                        Text("Forgot your password?")
                }
                
                Spacer()
                
            }
            .padding(.bottom, 90)
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
