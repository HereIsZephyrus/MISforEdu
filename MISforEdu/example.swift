import Foundation

var ex_blankuser_interface = UserInterface()
//var ex_student_interface = UserInterface(ID: "1234567890", password: "1234567890") as! StudentInterface
//var ex_teacher_interface = UserInterface(ID: "87654321", password: "87654321") as! TeacherInterface
//var ex_secretary_interface = UserInterface(ID: "123456", password: "123456") as! SecretaryInterface
var ex_student_interface = StudentInterface(ID: "1234567890", password: "1234567890")
var ex_teacher_interface = TeacherInterface(ID: "87654321", password: "87654321")
var ex_secretary_interface = SecretaryInterface(ID: "123456", password: "123456")
var ex_dean_interface = UserInterface(ID: "D1234", password: "D1234")
var ex_hr_interface = UserInterface(ID: "H1234", password: "H1234")
var ex_student_info = StudentInfo(name: "童川博", school: "地理与信息工程学院", enrollment: "2022", subject: "地理信息科学", email: "tongchuanbo@cug.edu.cn", sex: .male, birth: dateFormatter.date(from: "2003-11-17")!)
var ex_teacher_info = TeacherInfo(name: "郑坤", school: "地理与信息工程学院", enrollment: "2004", email: "ZhengK@cug.edu.cn", office: "地信楼-101", sex :.male , birth : dateFormatter.date(from: "1980-01-01")!, title: .associate_professor)
var ex_secretary_info = SecretaryInfo(name: "曾云", school: "地理与信息工程学院", enrollment: "2010", email: "zengyun@cug.edu.cn", sex : .famale, birth : dateFormatter.date(from: "1990-01-01")!)
var ex_student = Student(user: ex_student_interface)
var ex_teacher = Teacher(user: ex_teacher_interface)
var ex_secretary = Secretary(user: ex_secretary_interface)
let ex_courses : [LectureInfo] = [
LectureInfo(name: "线性代数", school: "地理与信息工程学院", type: .basic, assessment: .test,credit: 3.5),
LectureInfo(name: "数据库", school: "地理与信息工程学院", type: .restricted, assessment: .exam,credit: 3),
LectureInfo(name: "空间数据库", school: "地理与信息工程学院", type: .elective, assessment: .test,credit: 2.5)]

let ex_attendence : [AttendenceInfo] = [
AttendenceInfo(classID: "CS101", studentID: "1234567890", score: 92.5),
AttendenceInfo(classID: "CS101", studentID: "1234567890", score: 85.0),
AttendenceInfo(classID: "DB201", studentID: "1234567890", score: 78.0),
AttendenceInfo(classID: "WD301", studentID: "1234567890", score: 95.5),
AttendenceInfo(classID: "CS102", studentID: "1234567890", score: 87.5),
AttendenceInfo(classID: "CS102", studentID: "1234567890", score: 95.0),
AttendenceInfo(classID: "DB202", studentID: "1234567890", score: 88.0),
AttendenceInfo(classID: "WD302", studentID: "1234567890", score: 85.5),
AttendenceInfo(classID: "CS101", studentID: "0987654321", score: 88.5),
AttendenceInfo(classID: "CS101", studentID: "0987654321", score: 86.0),
AttendenceInfo(classID: "DB201", studentID: "0987654321", score: 82.0),
AttendenceInfo(classID: "WD301", studentID: "0987654321", score: 85.5)]
//let ex_attendence = AttendenceInfo(classID: "CS101", studentID: "1234567890", score: 92.5)

let ex_lecturelist_name : [String] = [
    "数据库与空间数据库1",
    "数据库与空间数据库2",
    "数据库与空间数据库3",
    "数据库与空间数据库4",
    "数据库与空间数据库5"
]
let ex_lecturelist_teacher : [String] = [
    "郑坤1",
    "郑坤2",
    "郑坤3",
    "郑坤4",
    "郑坤5"
]
