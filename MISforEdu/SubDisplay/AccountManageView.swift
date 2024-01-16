//
//  AccountManage.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI
    
struct AccountManageView: View {
    @State var user=Student(id: 20221000679, name: "童川博", sex: "男", email: "Channing@cug.edu.com", subjects: 4, enrollment: 2022, birth: "2003-13-17")
    @State var emailAddress: String = ""
    @State var name: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    @State private var isEditing :Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                AccountBasicInfo(uid: String(user.id), name: user.name, school: "地理与信息工程学院", subject: "地理信息科学")
                Divider()
                AccountEditableInfo(isEditing: $isEditing, birth: $user.birth, email: $user.email)
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
}

struct AccountManage_Previews: PreviewProvider {
    static var previews: some View {
        AccountManageView()
    }
}


struct AccountBasicInfo: View {
    let uid : String
    let name : String
    let school : String
    let subject : String
    var body: some View {
        HStack (alignment: .top){
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
            
            HStack(spacing: 20) {
                
                VStack(spacing:30) {
                    VStack(alignment:.center) {
                        Text("学号")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text(uid)
                            .font(.headline)
                    }
                    VStack( alignment:.center){
                        Text("姓名")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text(name)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
                Divider()
                VStack(spacing:30) {
                    VStack( alignment:.center){
                        Text("学院")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text(school)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.leading,10)
                    }
                    VStack( alignment:.center){
                        Text("专业")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text(subject)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
                
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
}

struct AccountEditableInfo: View {
    @ Binding var isEditing : Bool
    @ Binding var birth : String
    @ Binding var email : String
    @State private var selectedDate = Date()
    @State private var changedemail :String = ""
    var body: some View {
        
        VStack {
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
            if (isEditing){
                Button(action: {
                    isEditing = false
                    birth = dateFormatter.string(from: selectedDate)
                    if (changedemail != "") {email = changedemail}
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
                Spacer()
                
            }
        } .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
