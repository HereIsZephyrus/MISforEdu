import Foundation

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
        return ex_attendence[0]
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

struct CriticInfo{
    var classId: String
    var teacherId: String
    var score : Float
}
struct editCriticInterface : editInterface{
    var ID : String
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> CriticInfo{
        return .init(classId: "", teacherId: "", score: 0)
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
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
    func Push(execution: String) -> update_status{
        return .successful
    }
    func Fatch(ID : String) -> GradeInfo{
        return .init(classId: "", studentId: "", score: 0)
    }
    func Credential() -> String{
        return ""
    }
    func SyncWithDatabase() -> Bool{
        return true
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
