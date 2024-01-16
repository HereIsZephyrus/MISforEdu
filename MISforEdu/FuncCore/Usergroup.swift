import Foundation

protocol BasicUserInfo{
    var name : String {get set}
    var school : String {get set}
    var enrollment : String {get set}
    var sex : sex_type {get set}
    var birth : Date {get set}
}

struct StudentInfo : BasicUserInfo{
    var name : String 
    var school : String 
    var enrollment : String 
    var subject : String 
    var email : String 
    var sex : sex_type 
    var birth : Date 
}
struct TeacherInfo : BasicUserInfo {
    var name : String 
    var school : String 
    var enrollment : String 
    var email : String 
    var office : String 
    var sex : sex_type 
    var birth : Date 
    var title : title_type 
}
struct SecretaryInfo : BasicUserInfo {
    var name : String 
    var school : String 
    var enrollment : String 
    var email : String 
    var sex : sex_type 
    var birth : Date 
}

struct Student{
    var interface : UserInterface<StudentInfo>
    var info : StudentInfo
    init(user : UserInterface){
        self.interface = user
        self.info = user.Fatch(user.ID)
    }
    func AddSubjectToSchool(school : String) -> String{
        return school + '-' + subject
     }
}

struct Teacher{
    var interface : UserInterface<TeacherInfo>
    var info : TeacherInfo
    init(user : UserInterface){
        self.interface = user
        self.info = user.Fatch(user.ID)
    }
}
struct Secretary{
    var interface : UserInterface<SecretaryInfo>
    var info : SecretaryInfo
    init(user : UserInterface){
        self.interface = user
        self.info = user.Fatch(user.ID)
    }
}