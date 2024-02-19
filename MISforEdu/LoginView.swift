//
//  LoginView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct LoginView: View {
    //@State  private var userID: String = ""
    //@State  private var password: String = ""
    //@State var interface = UserInterface<Any>(ID: "", role: nil, password: "", logged: false, sync: true)
    var body: some View {
        ZStack{
            //Color.white.ignoresSafeArea(.all)
                
            NavigationStack{
                LoginHead()
                //MainLogView(userID: $userID, password: $password)
                MainLogView()
            }.navigationBarBackButtonHidden(true)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .ignoresSafeArea(.all)
                )
        }
    }
}

struct infoView:View{
    var body :some View{
        GeometryReader {geometry in
            VStack {
                Text("默认密码为学校统一表示号,使用邮箱找回功能敬请期待")
                    .frame(width:geometry.size.width,height: geometry.size.height,alignment: .topLeading)
                    .padding(40)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct MainLogView: View {
    let option_board = 150.0
    //@Environment(\.presentationMode) var mode
    //@Binding   var userID: String
    //@Binding   var password: String
    //@Binding var interface : UserInterface<Any>
    @State var showLogin: Bool = false
    @State var errorMessage: String = ""
    @State private var userRole: user_role = .Student
    @State var interface = UserInterface()
    //@State var showLoginInfo = true
    @State var beLogged = false
    
    var body: some View {
        GeometryReader {geometry in
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
                
                VStack {
                    HStack {
                            Button("登录"){
                                showLogin.toggle()
                            }
                            //.buttonStyle(.borderedProminent)
                            .alert(isPresented: $showLogin) {
                                toValidAlert()
                            }
                            .navigationDestination(isPresented: $beLogged) {
                                //print("log in")
                                //AccountView(userRole: .Student, userID: userID)
                                //AccountView(interface: $interface)
                            }
                        NavigationLink {
                            infoView()
                        } label: {
                            Text("忘记密码?")
                        }

                            //NavigationLink("忘记密码?",destination: infoView())
                        }
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
    }
    func toValidAlert() -> Alert
    {
        //let (credential,userRole) = isValidCredential(ID: userID, password:password)
        //var interface : UserInterface
        switch userRole {
        case .Student:
            interface = StudentInterface(interface: interface)
        case .Teacher:
            interface = TeacherInterface(interface: interface)
        case .Secretary:
            interface = SecretaryInterface(interface: interface)
        case .Dean :
            interface = DeanInterface(interface: interface)
        case .HR:
            interface = HRInterface(interface: interface)
        }
        let (validTitle,validMessage,validButton) = getValid(validString: interface.Credential())
        return Alert(title: Text(validTitle),message: Text(validMessage),dismissButton: validButton)
    }
    func getValid(validString: String) ->(String, String,Alert.Button?)
    {
        print(userRole)
        if (validString == ""){
            interface.logged = true
            beLogged = true
            return ("欢迎登录","你好" + interface.ID,.default(Text("好")/*,action: {interface.logged = true}*/))
        }
        else{
            return ("验证失败",validString,.destructive(Text("好")))
        }
    }
    /*
    func isValidCredential(ID: String, password: String) -> (Bool, user_role?) {
        var Accepted : Bool = false
        var Role : user_role? = nil
        errorMessage = ""
        switch ID.count{
        case 0:do{
            errorMessage = "请输入账号密码"
        }
        case 10:do {
            Role = .Student
        }
        case 9:do {
            Role = .Teacher
        }
        case 6:do {
            Role = .Secretary
        }
        case 5:do {
            if (ID[ID.startIndex] == "H"){Role = .HR}
            if (ID[ID.startIndex] == "D"){Role = .Dean}
        }
        default:
            errorMessage = "登录失败,用户名错误"
        }
        print(errorMessage)
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        if (errorMessage == "")
        {
            Accepted = true
        }
        //print(ID.count)
        //print(errorMessage)
        //print(Accepted)
        return (Accepted,Role)
    }*/
}

struct LoginHead: View {
    var body: some View {
        VStack {
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
}
