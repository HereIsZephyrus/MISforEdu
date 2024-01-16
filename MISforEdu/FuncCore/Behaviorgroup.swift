import Foundation

struct AttendenceInfo{
    var classId: String
    var studentId: String
    var score : Float
}
struct editAttendenceInterface : editInterface{
    var ID : String
    func Push() -> update_status
    func Fatch(ID : String) -> AttendenceInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}
struct ToAttendence{
    let interface : editAttendenceInterface
    var info : AttendenceInfo
    func Analysis(){

    }
}

struct CriticInfo{
    var classId: String
    var teacherId: String
    var score : Float
}
struct editCriticInterface : editInterface{
    var ID : String
    func Push() -> update_status
    func Fatch(ID : String) -> CriticInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}
struct ToCritic{
    let interface : editCriticInterface
    var info : CriticInfo
    func Analysis(){

    }
    func setScore(loc : Int, score : Float){

    }
}

struct GradeInfo{
    var classId: String
    var studentId: String
    var score : Float
}
struct editGradeInterface : editInterface{
    var ID : String
    func Push() -> update_status
    func Fatch(ID : String) -> GradeInfo
    func Credential() -> Bool{

    }
    func SyncWithDatabase() -> Bool{

    }
}
struct ToGrade{
    let interface : editGradeInterface
    var info : GradeInfo
    //var seperatedScore : [credit_type : Float]
    func Analysis(){

    }
    func setScore(loc : Int, score : Float){

    }
}