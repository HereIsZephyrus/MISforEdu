import Foundation

protocol editInterface {
    associatedtype returnType
    var ID : String {get set}
    func Push(execution : String) -> update_status
    mutating func Fatch(ID : String) -> returnType
    func Credential() -> String
    mutating func SyncWithDatabase() -> Bool
}
/*
protocol queryInterface{
    associatedtype returnType
    var ID : [String] {get set}
    mutating func Fatch(filter : Filter) -> returnType
}

protocol DisplayFormat{
    associatedtype displayType
    var style : style_format {get set}
    func Displayinfo(type : displayType) -> [String : String]
}
struct DisplayList<T> : DisplayFormat,queryInterface{
    var ID : [String]
    var style : style_format
    func Fatch(filter : Filter) -> T{
        return T(classId: "", studentId: "", score: 0) as! T
    }
    func Displayinfo(type : T) -> [String : String]{
        return [:]
    }
}*/
class DisplayList<T>{
    private var elements : [T] = []
    var filter : Filter
    func Fatch() -> [T]{
        return elements
    }
    init(filter : Filter){
        self.filter = filter
    }
}
class SchoolInfoDisplay : DisplayList<SchoolInfo>{
    private var elements : [SchoolInfo] = []
    override func Fatch() -> [SchoolInfo]{
        elements = ex_school_info
        return elements
    }
    override init(filter : Filter){
        super.init(filter: Filter())
    }
}
class SubjectInfoDisplay : DisplayList<SubjectInfo>{
    private var elements : [SubjectInfo] = []
    override func Fatch() -> [SubjectInfo]{
        elements = ex_subject_info
        return elements
    }
    override init(filter : Filter){
        super.init(filter: Filter())
    }
}
class LectureInfoDisplay : DisplayList<LectureInfo>{
    private var elements : [LectureInfo] = []
    override func Fatch() -> [LectureInfo]{
        return elements
    }
    override init(filter : Filter){
        super.init(filter: Filter())
    }
}

class UserInterface{
    var ID : String
    var password : String
    var logged : Bool
    var sync : Bool
    func SyncWithDatabase() -> Bool{
        return true
    }
    func Credential() -> String{
        return ""
    }
    func Push(execution : String) -> update_status{
        return .successful
    }
    init(){
        self.ID = ""
        self.password = ""
        self.logged = false
        self.sync = true
    }
    init(ID : String, password : String){
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }

}
class StudentInterface : UserInterface,BasicInterface{
    override func Credential() -> String{
        var errorMessage = ""
        if (ID.count == 0){
            errorMessage = "请输入账号密码"
        }
        else{
            if (ID.count != 10){
                errorMessage = "登录失败,用户名错误"
            }
        }
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        return errorMessage
    }
    func Fatch(ID : String)  ->  StudentInfo{
        //var info = StudentInfo(name: "", school: "", enrollment: "", subject: "", email: "", sex: .famale, birth: Date())
        var info = ex_student_info
        return info
    }
    override func Push(execution : String) -> update_status{
        self.sync = false
        //执行excution
        let uploaded : Bool = true
        if (uploaded){
            self.sync = true
            return .successful
        }
        else{
            return .connection_failed
        }
    }
    init(interface : UserInterface){
        super.init()
        self.ID = interface.ID
        self.password = interface.password
        self.logged = interface.logged
        self.sync = interface.sync
    }
    override init(ID : String, password : String){
        super.init()
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }
}

class TeacherInterface : UserInterface,BasicInterface{
    override func Credential() -> String{
        var errorMessage = ""
        if (ID.count == 0){
            errorMessage = "请输入账号密码"
        }
        else{
            if (ID.count != 8){
                errorMessage = "登录失败,用户名错误"
            }
        }
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        return errorMessage
    }
    func Fatch(ID : String)  ->  TeacherInfo{
        //var info = TeacherInfo(name: "", school: "", enrollment: "", email: "", office: "", sex: .famale, birth: Date(), title: .associate_professor)
        var info = ex_teacher_info
        return info
    }
    override func Push(execution : String) -> update_status{
        return .successful
    }
    init(interface : UserInterface){
        super.init()
        self.ID = interface.ID
        self.password = interface.password
        self.logged = interface.logged
        self.sync = interface.sync
    }
    override init(ID : String, password : String){
        super.init()
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }
}

class SecretaryInterface : UserInterface,BasicInterface{
    override func Credential() -> String{
        var errorMessage = ""
        if (ID.count == 0){
            errorMessage = "请输入账号密码"
        }
        else{
            if (ID.count != 6){
                errorMessage = "登录失败,用户名错误"
            }
        }
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        return errorMessage
    }
    func Fatch(ID : String)  ->  SecretaryInfo{
        //var info = SecretaryInfo(name: "", school: "", enrollment: "", email: "", sex: .famale, birth: Date())
        var info = ex_secretary_info
        return info
    }
    override func Push(execution : String) -> update_status{
        return .successful
    }
    init(interface : UserInterface){
        super.init()
        self.ID = interface.ID
        self.password = interface.password
        self.logged = interface.logged
        self.sync = interface.sync
    }
    override init(ID : String, password : String){
        super.init()
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }
}
class DeanInterface : UserInterface{
    override func Credential() -> String{
        var errorMessage = ""
        if (ID.count == 0){
            errorMessage = "请输入账号密码"
        }
        else{
            if (ID.count != 5 && ID[ID.startIndex] != "D"){
                errorMessage = "登录失败,用户名错误"
            }
        }
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        return errorMessage
    }
    func Fatch(ID : String)  ->  SecretaryInfo{
        var info = SecretaryInfo(name: "", school: "", enrollment: "", email: "", sex: .famale, birth: Date())
        return info
    }
    override func Push(execution : String) -> update_status{
        return .successful
    }
    init(interface : UserInterface){
        super.init()
        self.ID = interface.ID
        self.password = interface.password
        self.logged = interface.logged
        self.sync = interface.sync
    }
    override init(ID : String, password : String){
        super.init()
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }
}
class HRInterface : UserInterface{
    override func Credential() -> String{
        var errorMessage = ""
        if (ID.count == 0){
            errorMessage = "请输入账号密码"
        }
        else{
            if (ID.count != 5 && ID[ID.startIndex] != "H"){
                errorMessage = "登录失败,用户名错误"
            }
        }
        if (ID != password){
            errorMessage = "登录失败,密码错误"
        }
        return errorMessage
    }
    func Fatch(ID : String)  ->  SecretaryInfo{
        var info = SecretaryInfo(name: "", school: "", enrollment: "", email: "", sex: .famale, birth: Date())
        return info
    }
    override func Push(execution : String) -> update_status{
        return .successful
    }
    init(interface : UserInterface){
        super.init()
        self.ID = interface.ID
        self.password = interface.password
        self.logged = interface.logged
        self.sync = interface.sync
    }
    override init(ID : String, password : String){
        super.init()
        self.ID = ID
        self.password = password
        self.logged = false
        self.sync = true
    }
}
/*
struct User<T> {
    var ID : String
    var role : user_role
    var info : T
}*/
