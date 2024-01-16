import Foundation
struct LectureInfo {
    var name: String
    var school: String
    var type: lecture_type
    var assessment: credit_type
}
struct editLectureInterface : editInterface{
    var ID : String
    func Push() -> update_status
    func Fatch(ID : String) -> LectureInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

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
    func Push() -> update_status
    func Fatch(ID : String) -> ClassInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

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
    func Push() -> update_status
    func Fatch(ID : String) -> SchoolInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}
struct Class{
    let interface : editClassInterface
    var info : SchoolInfo
}

struct SubjectInfo {
    var name : String
    var code : String
}
struct editSchoolInterface : editInterface{
    var ID : String
    func Push() -> update_status
    func Fatch(ID : String) -> SubjectInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}
struct Class{
    let interface : editClassInterface
    var info : SubjectInfo
}