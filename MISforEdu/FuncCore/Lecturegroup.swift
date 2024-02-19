import Foundation
struct LectureInfo {
    var name: String
    var school: String
    var type: lecture_type
    var assessment: credit_type
}
struct editLectureInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> LectureInfo{
        return .init(name: "", school: "", type: .basic, assessment: .exam)
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
    var firstWeek : Int
    var lastWeek : Int
    var belongedLec: LectureInfo
    var classTime : [Int]
    var classRoom : String
}
struct editClassInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> ClassInfo{
        return .init(firstWeek: 1, lastWeek: 20, belongedLec: .init(name: "", school: "", type: .basic, assessment: .exam), classTime: [], classRoom: " ")
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
