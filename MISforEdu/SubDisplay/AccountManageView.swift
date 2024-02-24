//
//  AccountManage.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI
    

typealias infoStack = HStack<TupleView<(VStack<TupleView<(AccountInfoPair, AccountInfoPair, AccountInfoPair)>>, Divider, VStack<TupleView<(AccountInfoPair, AccountInfoPair, AccountInfoPair)>>)>>
class AccountInfoBucket : ObservableObject ,BasicEditInfo{
    @Published var email : String
    @Published var name : String
    @Published var password : String
    @Published var office : String
    @Published var birth : Date
    var role : user_role?
    init(){
        self.email = ""
        self.name = ""
        self.password = ""
        self.office = ""
        self.birth = Date()
        self.role = nil
    }
    init(info : StudentInfo){
        self.email = info.email
        self.name = info.name
        self.password = ""
        self.office = ""
        self.birth = info.birth
        self.role = .Student
    }
    init(info : TeacherInfo){
        self.email = info.email
        self.name = info.name
        self.password = ""
        self.office = info.office
        self.birth = info.birth
        self.role = .Teacher
    }
    init(info : SecretaryInfo){
        self.email = info.email
        self.name = info.name
        self.password = ""
        self.office = ""
        self.birth = info.birth
        self.role = .Secretary
    }
}
struct AccountManageView<T : User>: View {
    @Binding var user : T
    @ObservedObject var userInfo : AccountInfoBucket = AccountInfoBucket()
    @State var isEditing : Bool = false
    @State var saveChange : Bool = false
    var body: some View {
        let info = AccountBasicInfo(user : user)
        NavigationStack {
            VStack {
                AccountIdentityInfo(account_head_info : info)
                Divider()
                AccountEditableInfo<T>(saveChange: $saveChange,isEditing: $isEditing,user : $user)
                showSaveStatus(toSave: saveChange)
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
    
    func showSaveStatus(toSave : Bool) -> Text{
        if toSave{
            if user is Student{
                //typealias Student = T
                print(userInfo.birth)
                user.info.email = userInfo.email
                user.info.birth = userInfo.birth
                if userInfo.password.count > 0 {
                    user.interface.password = userInfo.password
                }
                // print(user.interface.Push(execution: user.GenerateSQL(type: .update)))

                //user = tmpUser as! T
            }
            
            if var tmpUser = user as? Teacher{
                tmpUser.info.email = userInfo.email
                //user.info.email = userInfo.email
                tmpUser.info.birth = userInfo.birth
                if userInfo.password.count > 0{
                    tmpUser.interface.password = userInfo.password
                }
                tmpUser.info.office = userInfo.office
                user = tmpUser as! T
            }
            if var tmpUser = user as? Secretary{
                tmpUser.info.email = userInfo.email
                //user.info.email = userInfo.email
                tmpUser.info.birth = userInfo.birth
                if userInfo.password.count > 0{
                    tmpUser.interface.password = userInfo.password
                }
                user = tmpUser as! T
            }
            return Text("保存成功(immutable特性给我干碎了)")
        }
        return Text("")
    }
    
    func AccountBasicInfo(user : T) -> infoStack{
        var account_head_info = HStack(spacing: 20) {
                VStack(spacing:30){
                    AccountInfoPair(title : "学号", content : "")
                    AccountInfoPair(title : "姓名", content : "")
                    AccountInfoPair(title : "性别", content : "男")
                }
                Divider()
                VStack(spacing:30) {
                    AccountInfoPair(title : "学院", content : "")
                    AccountInfoPair(title : "专业", content : "")
                    AccountInfoPair(title : "入学时间", content : "")
                }
                
            }
        
        if let studentInfo = user as? Student{
            account_head_info = HStack(spacing: 20) {
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
            account_head_info = HStack(spacing: 20) {
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
            account_head_info = HStack(spacing: 20) {
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
        return account_head_info
    }
}

struct AccountIdentityInfo: View {
    let account_head_info : infoStack
    var body: some View {
        HStack (alignment: .top){
            ManagePortrait()
            account_head_info.padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .frame(width: 400)
                .padding()
                .frame(height: 240)
                .padding()
            }
            
        }
}

struct AccountEditableInfo<T : User>: View {
    @Binding var saveChange : Bool
    @Binding var isEditing : Bool
    @Binding var user : T
    @ObservedObject var userInfo : AccountInfoBucket
    @State private var verifypwd :String = ""
    @State var showAlert : Bool = false
    init(saveChange : Binding<Bool>,isEditing: Binding<Bool>, user : Binding<T>) {
        self._saveChange = saveChange
        self._user = user
        self._isEditing = isEditing
        if let student = user.wrappedValue as? Student {
                self.userInfo = AccountInfoBucket(info: student.info)
            //typealias T = Student
            } else if let teacher = user.wrappedValue as? Teacher {
                self.userInfo = AccountInfoBucket(info: teacher.info)
            //    typealias T = Teacher
            } else if let secretary = user.wrappedValue as? Secretary {
                self.userInfo = AccountInfoBucket(info: secretary.info)
             //   typealias T = Student
            } else {
                // Handle the case where user is not of type Student, Teacher, or Secretary
                self.userInfo = AccountInfoBucket()
            }
    }
    var body: some View {
       
        VStack {
            let cols = [GridItem(.flexible()),GridItem(.flexible())]
            LazyVGrid(columns: cols,spacing: 10){
                HStack{
                    TitleText(content: "生日")
                        
                    if isEditing{
                        DatePicker("Select your birthday", selection: $userInfo.birth, displayedComponents: .date)
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
                    TitleText(content: "邮箱")
                    if isEditing{
                        TextField(userInfo.email, text: $userInfo.email)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }else{
                        Text(userInfo.email)
                            .frame(width:250,height:40)
                    }
                }
                if isEditing{
                    HStack{
                        TitleText(content: "新密码")
                        SecureField("", text: $userInfo.password)
                            .frame(width:200,height:40)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        TitleText(content: "确认密码")
                        SecureField("", text: $verifypwd)
                            .frame(width:250,height:40)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                if userInfo.role == .Teacher{
                    HStack{
                        TitleText(content: "办公室")
                        if isEditing{
                            TextField(userInfo.office, text: $userInfo.office)
                                .frame(width:200,height:40)
                                .textFieldStyle(.roundedBorder)
                        }else{
                            Text(userInfo.office)
                                .frame(width:120,height:40)
                        }
                    }
                }
            }

            if (isEditing){
                Button(action: {
                    showAlert = verifypwd != userInfo.password
                    if showAlert == false{
                        isEditing = false
                        saveChange = true
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
    
    func TitleText(content : String) -> some View{
        return Text(content)
            .font(.title)
            .foregroundColor(.blue)
            .frame(width:  100)
    }
}

struct AccountInfoPair: View {
    let title : String
    let content : String
    var body: some View {
        VStack(alignment:.center) {
            //TitileText(content :  title)
            Text(title)
                .font(.title)
                .foregroundColor(.blue)
                .frame(width:  200)
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

struct AccountManage_Previews: PreviewProvider {
    static var previews: some View {
        AccountManageView<Student>(user: .constant(ex_student))
        AccountManageView<Teacher>(user: .constant(ex_teacher))
    }
}
