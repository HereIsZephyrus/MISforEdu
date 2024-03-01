import Foundation
struct LectureInfo {
    var name: String
    var school: String
    var type: lecture_type
    var assessment: credit_type
    var credit: Float
}
struct editLectureInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> LectureInfo{
        return .init(name: "", school: "", type: .basic, assessment: .exam,credit: 1.0)
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
    }
}
struct Lecture{
    let interface : editLectureInterface
    var info : LectureInfo
}

struct ClassInfo {
    var name : String
    var firstWeek : Int
    var lastWeek : Int
    var belongedLec: LectureInfo
    var classTime : [Int]
    var classRoom : String
    var instructor : String
    var info : String
}
struct editClassInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> ClassInfo{
        return .init(name: "sjk-1", firstWeek: 1, lastWeek: 20, belongedLec: ex_lecture_info[0], classTime: [], classRoom: " ",instructor: "郑坤",info: "")
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
    }
}
struct Class{
    let interface : editClassInterface
    var info : ClassInfo
}

struct SchoolInfo {
    var name : String
    var building : String
}
struct editSchoolInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> SchoolInfo{
        return .init(name: "", building: "")
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
    }
}
struct School{
    let interface : editClassInterface
    var info : SchoolInfo
}

struct SubjectInfo {
    var name : String
    var code : String
}
struct editSubjectInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status {
        return .successful
    }
    func Fatch(ID : String) -> SubjectInfo{
        return .init(name: "", code: "")
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
    }
}
struct Subject{
    let interface : editClassInterface
    var info : SubjectInfo
}

struct AttendenceInfo{
    var classID: String
    var studentID: String
    var score : Float
}
struct editAttendenceInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> AttendenceInfo{
        return ex_attendence_info[0]
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
    }
}
struct ToAttendence{
    let interface : editAttendenceInterface
    var info : AttendenceInfo
    func Analysis(){

    }
}
