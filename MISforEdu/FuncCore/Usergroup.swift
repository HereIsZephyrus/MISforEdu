import Foundation

protocol BasicUserInfo{
    var name : String {get set}
    var school : String {get set}
    var enrollment : String {get set}
    var sex : sex_type {get set}
    var birth : Date {get set}
}
protocol BasicEditInfo{
    var email : String {get set}
    //var office : String {get set}
    var birth : Date {get set}
}
protocol BasicInterface{
    var ID : String {get set}
    var password : String {get set}
}

struct StudentInfo : BasicUserInfo, BasicEditInfo{
    var name : String
    var school : String 
    var enrollment : String 
    var subject : String 
    var email : String 
    var sex : sex_type 
    var birth : Date 
}
struct TeacherInfo : BasicUserInfo, BasicEditInfo {
    var name : String
    var school : String 
    var enrollment : String 
    var email : String 
    var office : String 
    var sex : sex_type 
    var birth : Date 
    var title : title_type 
}
struct SecretaryInfo : BasicUserInfo, BasicEditInfo {
    var name : String
    var school : String 
    var enrollment : String 
    var email : String 
    var sex : sex_type 
    var birth : Date 
}

protocol User{
    //associatedtype user_info : AccountInfo
    associatedtype user_info : BasicEditInfo
    associatedtype user_interface : BasicInterface
    var info : user_info {get set}
    var interface : user_interface {get set}
}
struct Student : User{
    var interface : StudentInterface
    var info : StudentInfo
    init(user : StudentInterface){
        self.interface = user
        self.info = user.Fatch(ID : user.ID)
    }
    init (student : Student){
        self.interface = student.interface
        self.info = student.info
        self.interface.ID = student.interface.ID
        self.interface.password = student.interface.password
        self.interface.logged = student.interface.logged
        self.interface.sync = student.interface.sync
        self.info.name = student.info.name
        self.info.school = student.info.school
        self.info.enrollment = student.info.enrollment
        self.info.subject = student.info.subject
        self.info.email = student.info.email
        self.info.sex = student.info.sex
        self.info.birth = student.info.birth
    }
    func AddSubjectToSchool(school : String) -> String{
        return school + "-" + info.subject
     }
    func GenerateSQL(type : injection_type) -> String{
        switch type {
        case .update:
            let sql_command = "UPDATE PersonClass.Student\n"
            let sql_execution = "SET name = \(info.name), school = \(info.school), enrollment = \(info.enrollment), subject = \(info.subject), email = \(info.email)\n"
            let sql_location = "WHERE ID = \(interface.ID)\n" 
            return sql_command + sql_execution + sql_location
        case .insert:
            let sql_command = "INSERT INTO PersonClass.Student"
            let sql_execution = "VALUES (\(interface.ID), \(info.name), \(info.school), \(info.enrollment), \(info.subject), \(info.email)\n"
            return sql_command + sql_execution
        case .delete:
            let sql_command = "DELETE FROM PersonClass.Student"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .select:
            let sql_command = "SELECT * FROM PersonClass.Student\n"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .other:
            return ""
        }
    }
}

struct Teacher : User{
    var interface : TeacherInterface
    var info : TeacherInfo
    init(user : TeacherInterface){
        self.interface = user
        self.info = user.Fatch(ID : user.ID)
    }
    init (teacher : Teacher){
        interface = teacher.interface
        info = teacher.info
    }
    func GenerateSQL(type : injection_type) -> String{
        switch type {
        case .update:
            let sql_command = "UPDATE PersonClass.Teacher\n"
            let sql_execution = "SET name = \(info.name), school = \(info.school), enrollment = \(info.enrollment), office = \(info.office), email = \(info.email)\n"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_execution + sql_location
        case .insert:
            let sql_command = "INSERT INTO PersonClass.Teacher"
            let sql_execution = "VALUES (\(interface.ID), \(info.name), \(info.school), \(info.enrollment), \(info.office), \(info.email)\n"
            return sql_command + sql_execution
        case .delete:
            let sql_command = "DELETE FROM PersonClass.Teacher"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .select:
            let sql_command = "SELECT * FROM PersonClass.Teacher\n"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .other:
            return ""
        }
    }
}
struct Secretary : User{
    var interface : SecretaryInterface
    var info : SecretaryInfo
    init(user : SecretaryInterface){
        self.interface = user
        self.info = user.Fatch(ID : user.ID)
    }
    init (secretary : Secretary){
        interface = secretary.interface
        info = secretary.info
    }
    func GenerateSQL(type : injection_type) -> String{
        switch type {
        case .update:
            let sql_command = "UPDATE PersonClass.Secretary\n"
            let sql_execution = "SET name = \(info.name), school = \(info.school), enrollment = \(info.enrollment), email = \(info.email)\n"
            let sql_location = "WHERE ID = \(interface.ID)\n" 
            return sql_command + sql_execution + sql_location
        case .insert:
            let sql_command = "INSERT INTO PersonClass.Secretary"
            let sql_execution = "VALUES (name = \(info.name), school = \(info.school), enrollment = \(info.enrollment), \(info.email))\n"
            return sql_command + sql_execution
        case .delete:
            let sql_command = "DELETE FROM PersonClass.Secretary"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .select:
            let sql_command = "SELECT * FROM PersonClass.Secretary\n"
            let sql_location = "WHERE ID = \(interface.ID)\n"
            return sql_command + sql_location
        case .other:
            return ""
        }
    }
}
