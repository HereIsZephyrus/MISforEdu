//
//  LoginView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct LoginView: View {
    @State private var userRole: user_role = .Student
    @State var interface = UserInterface()
    @State var showLogin: Bool = false
    //@State var beLogged = false
    var body: some View {
        NavigationStack{
            LoginHead()
            MainLogView()
            LoginBar()
        }.navigationBarBackButtonHidden(true)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .ignoresSafeArea(.all)
            )
    }
    
    func toValidAlert() -> Alert
    {
        //let (credential,userRole) = isValidCredential(ID: userID, password:password)
        //var interface : UserInterface
        var validTitle : String = ""
        var validMessage : String = ""
        var validButton : Alert.Button? = nil
        switch userRole {
        case .Student:
            let copyInterface = StudentInterface(interface: interface)
            (validTitle,validMessage,validButton) = getValid(validString: copyInterface.Credential() )

        case .Teacher:
            let copyInterface = TeacherInterface(interface: interface)
            (validTitle,validMessage,validButton) = getValid(validString: copyInterface.Credential() )
        case .Secretary:
            let copyInterface = SecretaryInterface(interface: interface)
            (validTitle,validMessage,validButton) = getValid(validString: copyInterface.Credential() )
        case .Dean :
            let copyInterface = DeanInterface(interface: interface)
            (validTitle,validMessage,validButton) = getValid(validString: copyInterface.Credential() )
        case .HR:
            let copyInterface = HRInterface(interface: interface)
            (validTitle,validMessage,validButton) = getValid(validString: copyInterface.Credential() )
        }
        return Alert(title: Text(validTitle),message: Text(validMessage),dismissButton: validButton)
        
        func getValid(validString: String) ->(String, String,Alert.Button?)
        {
            print(validString)
            if (validString == ""){
                interface.logged = true
                //beLogged = true
                //print(beLogged)
                print(interface.logged)
                return ("欢迎登录","你好" + interface.ID,.default(Text("好")/*,action: {interface.logged = true}*/))
            }
            else{
                return ("验证失败",validString,.destructive(Text("好")))
            }
        }
    }
    
    func LoginHead() -> some View{
        return VStack {
            Image("CUG_title")
                .resizable()
                .frame(width: 400, height: 110)
                .scaledToFit()
                .padding(.top, 30)
                .padding(.bottom, 10)
            Text("一站式教学管理系统")
                .font(.largeTitle)
                .padding(.vertical, 50)
        }
    }
    func LoginBar() -> some View{
        return  HStack {
            NavigationLink(destination: AccountView(interface: .constant(ex_student_interface)), tag: true, selection: Binding<Bool?>(
                get: { interface.logged },
                set: { interface.logged = $0 ?? false }
            )) {
                Button("登录"){
                    showLogin.toggle()
                    print(showLogin)
                }
                //.buttonStyle(.borderedProminent)
                .alert(isPresented: $showLogin) {
                    toValidAlert()
                }
            }
            NavigationLink {   InfoView() } label: { Text("忘记密码?")}
        }
        func InfoView() -> some View{
            return GeometryReader {geometry in
                VStack {
                    Text("默认密码为学校统一表示号,使用邮箱找回功能敬请期待")
                        .frame(width:geometry.size.width,height: geometry.size.height,alignment: .topLeading)
                        .padding(40)
                }
            }
        }
    }
    func MainLogView() -> some View{
        let option_board = 150.0
        return GeometryReader {geometry in
            VStack(spacing :20) {
                ZStack(alignment: .bottom){
                    Image("background_login")
                        .resizable()
                        .scaledToFit()
                    //.frame(height: 350)
                    //.padding(10)
                    VStack(alignment: .leading){
                        HStack{
                            //var interface = UserInterface<T>
                            TextField("学号/教工号/职工号", text: $interface.ID)
                                .frame(width: geometry.size.width * 0.6 - option_board, height: 50)
                                //.textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            VStack {
                                Picker("User Role", selection: $userRole) {
                                    ForEach(user_role.allCases) { role in
                                        Text(role.rawValue).tag(role)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .padding(8)
                                .frame(width: 140)
                                .background(
                                    RoundedRectangle(cornerRadius:  10)
                                        .fill(.white)
                                )
                            }
                        }
                        
                        SecureField("密码", text: $interface.password)
                            .frame(width: geometry.size.width * 0.6, height: 50)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .foregroundColor(.gray)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .textContentType(.password)
                            .cornerRadius(5)
                            .padding(.bottom,40)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

