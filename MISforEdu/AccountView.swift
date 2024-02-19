//
//  AccountView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/17/24.
//

import SwiftUI

struct AccountView: View {
    //let userID: String
    //let userName : String
    //let userSchool : String
    //let user.role : user_role
    @Binding var interface : UserInterface
    /*
    init(user.role :user_role, userID :String){
        self.user.role = user.role
        self.userID = userID
        if (user.role == .Student || user.role == .Teacher || user.role == .Secretary){
            //query
            self.userName = "TCB"
            self.userSchool = "地理与信息工程学院"
        }
        else{
            self.userName = "-"
            self.userSchool = "-"
        }
    }*/
    //@Environment(\.presentationMode) var isLoggedin
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
            if let userInterface = interface as? StudentInterface{
            //if (interface.role == .Student){
                //let studentInterface = interface as! UserInterface<StudentInfo>
                @State var user = Student(user: userInterface)
                NavigationStack{
                    headerView(showinfo: true, identify: "学号",userID: user.interface.ID,userName: user.info.name,userSchool: user.AddSubjectToSchool(school: user.info.school))
                            Form {
                                Section {
                                    NavigationLink(destination: AccountManageView<Student>(user: $user)) {
                                        Text("信息管理")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: SyllabusView()) {
                                        Text("课表查看")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: GradeCheckView()) {
                                        Text("成绩查询")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: CriticManageView(isFirst: .constant(true))) {
                                        Text("教学评价")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: AttendView()) {
                                        Text("选课系统")
                                    }
                                }
                                Section {
                                    LogoutButton(interface: $interface)
                                }
                            }
                        }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            }
            if let userInterface = interface as? TeacherInterface{
            //if (interface.role == .Teacher){
                @State var user = Teacher(user : userInterface)
                NavigationStack {
                                headerView(showinfo: true, identify: "教工号",userID: user.interface.ID,userName: user.info.name,userSchool: user.info.school)
                                Form {
                                    Section {
                                        NavigationLink(destination: AccountManageView<Teacher>(user: $user)) {
                                            Text("信息管理")
                                        }
                                    }
                                    Section {
                                        NavigationLink(destination: SyllabusView()) {
                                            Text("课表查看")
                                        }
                                    }
                                    Section {
                                        NavigationLink(destination: GradeManageView())   {
                                            Text("成绩管理")
                                        }
                                    }
                                    Section {
                                        NavigationLink(destination: CriticCheckView())  {
                                            Text("教学评价")
                                        }
                                    }
                                    Section {
                                        NavigationLink(destination: InstructManageView())   {
                                            Text("教学管理")
                                        }
                                    }
                                    Section {
                                        NavigationLink(destination: LoginView())   {
                                            Button(action : {
                                                
                                            } ,
                                                   label: {Text("退出登录")
                                                    .foregroundColor(Color.red)
                                            })
                                        }
                                    }
                                }
                                
                            }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))            
            }
            if let userInterface = interface as? SecretaryInterface{
            //if (interface.role == .Secretary){
                @State var user = Secretary(user : userInterface)
                        NavigationStack{
                            headerView(showinfo: true, identify: "职工号",userID: user.interface.ID,userName: user.info.name,userSchool: user.info.school)
                            Form {
                                Section {
                                    NavigationLink(destination: AccountManageView<Secretary>(user: $user)) {
                                        Text("信息管理")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: PersonCheckView()) {
                                        Text("学生管理")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: ClassManageView()) {
                                        Text("课程管理")
                                    }
                                }
                                Section {
                                    NavigationLink(destination: LoginView())   {
                                        Button(action : {
                                            
                                        } ,
                                               label: {Text("退出登录")
                                                .foregroundColor(Color.red)
                                        })
                                    }
                                }
                            }
                        }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            }
            if let userInterface = interface as? DeanInterface{
            //if( interface.role == .Dean){
                    NavigationStack{
                        headerView(showinfo: false, identify: "-",userID: userInterface.ID,userName: "-",userSchool: "-")
                        Form {
                            Section {
                                NavigationLink(destination: ClassManageView()) {
                                    Text("课程管理")
                                }
                            }
                            Section {
                                NavigationLink(destination: ClassManageView()) {
                                    Text("选课管理")
                                }
                            }
                            Section {
                                NavigationLink(destination: GradeCheckView()) {
                                    Text("成绩管理")
                                }
                            }
                            Section {
                                NavigationLink(destination: CriticCheckView()) {
                                    Text("评价查询")
                                }
                            }
                            Section {
                                NavigationLink(destination: LoginView())   {
                                    Button(action : {
                                        
                                    } ,
                                           label: {Text("退出登录")
                                            .foregroundColor(Color.red)
                                    })
                                }
                            }
                        }
                    }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            }
            if let userInterface = interface as? HRInterface{
            //if (interface.role == .HR){
                    NavigationStack{
                        headerView(showinfo: false, identify: "-",userID: userInterface.ID,userName: "-",userSchool: "-")
                        Form {
                            Section {
                                NavigationLink(destination: PersonCheckView()) {
                                    Text("学生管理")
                                }
                            }
                            Section {
                                NavigationLink(destination: PersonCheckView()) {
                                    Text("教师管理")
                                }
                            }
                            Section {
                                NavigationLink(destination: SyllabusView()) {
                                    Text("课程查询")
                                }
                            }
                            Section {
                                NavigationLink(destination: CriticCheckView()) {
                                    Text("评价查询")
                                }
                            }
                            Section {
                                NavigationLink(destination: LoginView())   {
                                    Button(action : {
                                        
                                    } ,
                                           label: {Text("退出登录")
                                            .foregroundColor(Color.red)
                                    })
                                }
                            }
                        }
                    }.background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            }
        }
        }
        
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        //AccountView(user.role : .Secretary, userID : "20221000679")
        //AccountView(interface : .constant(StudentInterface(ID: "1234567890", password: "1234567890")))
        AccountView(interface : .constant(ex_student_interface))
        AccountView(interface : .constant(ex_teacher_interface))
        AccountView(interface : .constant(ex_secretary_interface))
    }
}

struct headerView: View {
    let showinfo : Bool
    let identify : String
    let userID: String
    let userName : String
    let userSchool : String
    
    var body: some View {
        if (showinfo == true){
            GeometryReader { geometry in
                VStack(alignment: .center){
                    Image("CUG_logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                    //.background(Color.yellow)
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                    Text(userName)
                        .font(.title)
                    ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.orange)
                                .frame(width: geometry.size.width - 200,height:70)
                                .padding(.vertical,10)
                            HStack(alignment: .center,spacing: 60){
                                HStack(spacing:20){
                                    Text("\(identify):")
                                        .font(.title3)
                                    Text(userID)
                                }
                                //.background()
                                HStack(spacing:20){
                                    Text("学院:")
                                        .font(.title3)
                                    Text(userSchool)
                                }
                            }
                        }.padding(.top,20)
                }.frame(width: geometry.size.width,height:400)
            }
        }
        else{
            VStack{
                Image("CUG_logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                //.background(Color.yellow)
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                Text("你好,admin")
                    .font(.title)
            }
        }
    }
}

struct LogoutButton: View {
    @Binding var interface : UserInterface
    var body: some View {
        NavigationLink(destination: LoginView())   {
            Button(action : {
                interface.logged = false
            } ,
                   label: {Text("退出登录")
                    .foregroundColor(Color.red)
            })
        }
    }
}
