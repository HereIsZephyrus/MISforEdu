//
//  AccountManage.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI
    

typealias infoStack = HStack<TupleView<(VStack<TupleView<(AccountInfoPair, AccountInfoPair, AccountInfoPair)>>, Divider, VStack<TupleView<(AccountInfoPair, AccountInfoPair, AccountInfoPair)>>)>>
class AccountInfoBucket{
    @State var emailAddress : String
    @State var name : String
    @State var password : String
    @State var office : String
    @State var birth : Date
    var role : user_role?
    init(){
        self.emailAddress = ""
        self.name = ""
        self.password = ""
        self.office = ""
        self.birth = Date()
        self.role = nil
    }
    init(info : StudentInfo,pwd : String){
        self.emailAddress = info.email
        self.name = info.name
        self.password = pwd
        self.office = ""
        self.birth = info.birth
        self.role = .Student
    }
    init(info : TeacherInfo,pwd : String){
        self.emailAddress = info.email
        self.name = info.name
        self.password = pwd
        self.office = info.office
        self.birth = info.birth
        self.role = .Teacher
    }
    init(info : SecretaryInfo,pwd : String){
        self.emailAddress = info.email
        self.name = info.name
        self.password = pwd
        self.office = ""
        self.birth = info.birth
        self.role = .Secretary
    }
}
struct AccountManageView<T>: View {
    //@State var user=oldStudent(id: 20221000679, name: "童川博", sex: "男", email: "Channing@cug.edu.com", subjects: 4, enrollment: 2022, birth: "2003-13-17")
    @Binding var user : T
    @State var isEditing : Bool = false
    //@State var editInfo : AccountInfoBucket //= AccountInfoBucket()
    var body: some View {
        let info = AccountBasicInfo(user : user)
        NavigationStack {
            VStack {
                //AccountBasicInfo(uid: String(user.id), name: user.name, school: "地理与信息工程学院", subject: "地理信息科学")
                AccountIdentityInfo(infoVIew : info as! infoStack)
                Divider()
               // AccountEditableInfo(isEditing: $isEditing, birth: $user.birth, email: $user.email)
                AccountEditableInfo<T>(isEditing: $isEditing,user : $user)
                Spacer()
            }
            
        .navigationTitle("个人信息管理")
        .navigationBarItems(trailing:
            Button(action: {
                isEditing.toggle()
            }) {
                Text(isEditing ? "Cancel" : "Edit")
            }
        )
        }
    }
    func AccountBasicInfo(user : T) -> some View{
        var contentView : infoStack?
        if let studentInfo = user as? Student{
            contentView = HStack(spacing: 20) {
                VStack(spacing:30){
                    AccountInfoPair(title : "学号", content : studentInfo.interface.ID)
                    AccountInfoPair(title : "姓名", content : studentInfo.info.name)
                    AccountInfoPair(title : "性别", content : String(studentInfo.info.sex.rawValue))
                }
                Divider()
                VStack(spacing:30) {
                    AccountInfoPair(title : "学院", content : studentInfo.info.school)
                    AccountInfoPair(title : "专业", content : studentInfo.info.subject)
                    AccountInfoPair(title : "入学时间", content : studentInfo.info.enrollment)
                }
                
            }
        }
        if let teacherInfo = user as? Teacher{
            contentView = HStack(spacing: 20) {
                VStack(spacing:30){
                    AccountInfoPair(title : "教工号", content : teacherInfo.interface.ID)
                    AccountInfoPair(title : "姓名", content : teacherInfo.info.name)
                    AccountInfoPair(title : "性别", content : String(teacherInfo.info.sex.rawValue))
                }
                Divider()
                VStack(spacing:30) {
                    AccountInfoPair(title : "学院", content : teacherInfo.info.school)
                    AccountInfoPair(title : "职称", content : String(teacherInfo.info.title.rawValue))
                    AccountInfoPair(title : "入职时间", content : teacherInfo.info.enrollment)
                }
                
            }
        }
        if let secretaryInfo = user as? Secretary{
            contentView = HStack(spacing: 20) {
                VStack(spacing:30){
                    AccountInfoPair(title : "职工号", content : secretaryInfo.interface.ID)
                    AccountInfoPair(title : "姓名", content : secretaryInfo.info.name)
                    AccountInfoPair(title : "性别", content : String(secretaryInfo.info.sex.rawValue))
                }
                Divider()
                VStack(spacing:30) {
                    AccountInfoPair(title : "学院", content : secretaryInfo.info.school)
                    AccountInfoPair(title : "-", content : "-")
                    AccountInfoPair(title : "入职时间", content : secretaryInfo.info.enrollment)
                }
            }
        }
        return contentView
    }
}

struct AccountManage_Previews: PreviewProvider {
    static var previews: some View {
        AccountManageView<Student>(user: .constant(ex_student))
    }
}

struct AccountIdentityInfo: View {
    //let uid : String
    //let name : String
   // let school : String
    //let subject : String
    let infoVIew : infoStack
    var body: some View {
        HStack (alignment: .top){
            ManagePortrait()
            infoView()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .frame(width: 400)
            .padding()
            .frame(height: 240)
            .padding()
        }
}

struct AccountEditableInfo<T>: View {
    @Binding var isEditing : Bool
    //@ Binding var birth : String
    //@ Binding var email : String
    var userInfo : AccountInfoBucket
    @Binding var user : T
    //@State private var selectedDate = Date()
    @State private var verifypwd :String = ""
    @State var showAlert : Bool = false
    init(isEditing: Binding<Bool>, user : Binding<T>) {
        self._user = user
        self._isEditing = isEditing
        if let student = user.wrappedValue as? Student {
                self.userInfo = AccountInfoBucket(info: student.info, pwd: student.interface.ID)
            //typealias T = Student
            } else if let teacher = user.wrappedValue as? Teacher {
                self.userInfo = AccountInfoBucket(info: teacher.info, pwd: teacher.interface.ID)
            //    typealias T = Teacher
            } else if let secretary = user.wrappedValue as? Secretary {
                self.userInfo = AccountInfoBucket(info: secretary.info, pwd: secretary.interface.ID)
             //   typealias T = Student
            } else {
                // Handle the case where user is not of type Student, Teacher, or Secretary
                self.userInfo = AccountInfoBucket()
            }
    }
    var body: some View {
       
        VStack {
            /*
            HStack {
                HStack{
                    Text("生日")
                        .font(.title)
                        .foregroundColor(.blue)
                    if isEditing{
                        DatePicker("Select your birthday", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(.automatic)
                            .labelsHidden()
                            .frame(width:120,height:40)
                            .padding(.horizontal,20)
                    }else{
                        Text(birth)
                            .frame(width:100,height:40)
                            .padding(.horizontal,20)
                    }
                }
                Spacer()
                HStack{
                    Text("邮箱")
                        .font(.title)
                        .foregroundColor(.blue)
                    if isEditing{
                        TextField(email, text: $changedemail)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }else{
                        Text(email)
                            .frame(width:250,height:40)
                    }
                }
            }.padding(.horizontal,40)
            */
            let cols = [GridItem(.flexible()),GridItem(.flexible())]
            LazyVGrid(columns: cols,spacing: 10){
                HStack{
                    Text("生日")
                        .font(.title)
                        .foregroundColor(.blue)
                    if isEditing{
                        DatePicker("Select your birthday", selection: userInfo.$birth, displayedComponents: .date)
                            .datePickerStyle(.automatic)
                            .labelsHidden()
                            .frame(width:120,height:40)
                            .padding(.horizontal,20)
                    }else{
                        Text(dateFormatter.string(from: userInfo.birth))
                            .frame(width:100,height:40)
                            .padding(.horizontal,20)
                    }
                }
                HStack{
                    Text("邮箱")
                        .font(.title)
                        .foregroundColor(.blue)
                    if isEditing{
                        TextField(userInfo.emailAddress, text: userInfo.$emailAddress)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }else{
                        Text(userInfo.emailAddress)
                            .frame(width:250,height:40)
                    }
                }
                if userInfo.role == .Teacher{
                    HStack{
                        Text("办公室")
                            .font(.title)
                            .foregroundColor(.blue)
                        if isEditing{
                            TextField(userInfo.office, text: userInfo.$office)
                                .frame(width:250,height:40)
                                .textFieldStyle(.roundedBorder)
                        }else{
                            Text(userInfo.office)
                                .frame(width:250,height:40)
                        }
                    }
                }
                if isEditing{
                    HStack{
                        Text("新密码")
                            .font(.title)
                            .foregroundColor(.blue)
                        SecureField("", text: userInfo.$password)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        Text("确认密码")
                            .font(.title)
                            .foregroundColor(.blue)
                        SecureField("", text: $verifypwd)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }
                }
            }

            if (isEditing){
                Button(action: {
                    showAlert = verifypwd != userInfo.password
                    if showAlert == false{
                        isEditing = false
                        
                        if var tmpUser = user as? Student{
                            tmpUser.info.email = userInfo.emailAddress
                            //user.info.email = userInfo.emailAddress
                            tmpUser.info.birth = userInfo.birth
                            if userInfo.password.count > 0{
                                tmpUser.interface.password = userInfo.password
                            }
                            user = tmpUser as! T
                        }
                        
                        if var tmpUser = user as? Teacher{
                            tmpUser.info.email = userInfo.emailAddress
                            //user.info.email = userInfo.emailAddress
                            tmpUser.info.birth = userInfo.birth
                            if userInfo.password.count > 0{
                                tmpUser.interface.password = userInfo.password
                            }
                            tmpUser.info.office = userInfo.office
                            user = tmpUser as! T
                        }
                        if var tmpUser = user as? Secretary{
                            tmpUser.info.email = userInfo.emailAddress
                            //user.info.email = userInfo.emailAddress
                            tmpUser.info.birth = userInfo.birth
                            if userInfo.password.count > 0{
                                tmpUser.interface.password = userInfo.password
                            }
                            user = tmpUser as! T
                        }
                    }
                    else{
                        userInfo.password = ""
                        verifypwd = ""
                    }
                    //birth = dateFormatter.string(from: selectedDate)
                    //if (changedemail != "") {email = changedemail}
                    // your action here
                }) {
                    HStack {
                        Text("保存")
                    }
                    .padding()
                    .frame(width: 160, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                }.padding(.bottom, 40)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("保存失败"), message: Text("您两次输入的密码不一致"), dismissButton: .default(Text("好的")))
                }
                Spacer()
                
            }
        } .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
    
}

struct AccountInfoPair: View {
    let title : String
    let content : String
    var body: some View {
        VStack(alignment:.center) {
            Text(title)
                .font(.title)
                .foregroundColor(.blue)
            Text(content)
                .font(.headline)
        }
    }
}

struct ManagePortrait: View {
    var body: some View {
        VStack(spacing:0) {
            Image("CUG_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 250,height: 250)
                .clipShape(Circle())
                .padding(.bottom,-30)
            Button(action: {
                print("Add photo")
            }) {
                VStack(alignment: .center) {
                    Text("更改头像")
                        .font(.system(size: 10))
                }.padding()
                    .frame(width: 100, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
    }
}
