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
let ex_classlist_ID : [String] = [
    "001",
    "002",
    "003",
    "004",
    "005"
]

let ex_school_info : [SchoolInfo] = [
    SchoolInfo(name: "体育学院", building: "体育馆"),
    SchoolInfo(name: "外国语学院", building: "外国语楼"),
    SchoolInfo(name: "马克思主义学院", building: "马克思主义楼"),
    SchoolInfo(name: "地球科学学院", building: "地球科学楼"),
    SchoolInfo(name: "地理与信息工程学院", building: "地信楼"),
    SchoolInfo(name: "资源学院", building: "资源楼"),
    SchoolInfo(name: "海洋学院", building: "海洋楼"),
    SchoolInfo(name: "工程学院", building: "工程楼"),
    SchoolInfo(name: "公共管理学院", building: "公管楼"),
    SchoolInfo(name: "材料与化学学院", building: "材化楼"),
    SchoolInfo(name: "环境学院", building: "环境楼"),
    SchoolInfo(name: "地球物理与空间信息学院", building: "地空楼"),
    SchoolInfo(name: "自动化学院", building: "自动化楼"),
    SchoolInfo(name: "机械与电子信息学院", building: "机电楼"),
    SchoolInfo(name: "经济管理学院", building: "经管楼"),
    SchoolInfo(name: "计算机学院", building: "计算机楼"),
    SchoolInfo(name: "数学与物理学院", building: "基础楼"),
    SchoolInfo(name: "珠宝学院", building: "珠宝楼"),
    SchoolInfo(name: "艺术与传媒学院", building: "艺媒楼")
]

let ex_subject_info : [SubjectInfo] = [
    SubjectInfo(name: "地球化学", code: "001"),
    SubjectInfo(name: "资源勘查工程", code: "002"),
    SubjectInfo(name: "石油工程", code: "003"),
    SubjectInfo(name: "应用化学", code: "004"),
    SubjectInfo(name: "材料科学与工程", code: "005"),
    SubjectInfo(name: "材料化学", code: "006"),
    SubjectInfo(name: "水文与水资源工程", code: "007"),
    SubjectInfo(name: "地下水科学与工程", code: "008"),
    SubjectInfo(name: "环境工程", code: "009"),
    SubjectInfo(name: "生物科学", code: "010"),
    SubjectInfo(name: "大气科学", code: "011"),
    SubjectInfo(name: "土木工程", code: "012"),
    SubjectInfo(name: "城市地下空间工程", code: "013"),
    SubjectInfo(name: "安全工程", code: "014"),
    SubjectInfo(name: "地质工程", code: "015"),
    SubjectInfo(name: "应急技术与管理", code: "016"),
    SubjectInfo(name: "勘查技术与工程（钻探工程）", code: "017"),
    SubjectInfo(name: "勘查技术与工程（勘查地球物理）", code: "018"),
    SubjectInfo(name: "地球物理学", code: "019"),
    SubjectInfo(name: "地球信息科学与技术", code: "020"),
    SubjectInfo(name: "机械设计制造及其自动化", code: "021"),
    SubjectInfo(name: "工业设计", code: "022"),
    SubjectInfo(name: "电子信息工程", code: "023"),
    SubjectInfo(name: "通信工程", code: "024"),
    SubjectInfo(name: "信息管理与信息系统", code: "025"),
    SubjectInfo(name: "工程管理", code: "026"),
    SubjectInfo(name: "工商管理", code: "027"),
    SubjectInfo(name: "市场营销", code: "028"),
    SubjectInfo(name: "会计学", code: "029"),
    SubjectInfo(name: "经济学", code: "030"),
    SubjectInfo(name: "国际经济与贸易", code: "031"),
    SubjectInfo(name: "旅游管理", code: "032"),
    SubjectInfo(name: "统计学", code: "033"),
    SubjectInfo(name: "英语", code: "034"),
    SubjectInfo(name: "地理科学", code: "035"),
    SubjectInfo(name: "自然地理与资源环境", code: "036"),
    SubjectInfo(name: "软件工程", code: "037"),
    SubjectInfo(name: "测绘工程", code: "038"),
    SubjectInfo(name: "遥感科学与技术", code: "039"),
    SubjectInfo(name: "地理信息科学", code: "040"),
    SubjectInfo(name: "地理空间信息工程", code: "041"),
    SubjectInfo(name: "数学与应用数学", code: "042"),
    SubjectInfo(name: "信息与计算科学", code: "043"),
    SubjectInfo(name: "物理学", code: "044"),
    SubjectInfo(name: "社会体育指导与管理", code: "045"),
    SubjectInfo(name: "宝石及材料工艺学", code: "046"),
    SubjectInfo(name: "产品设计（珠宝首饰设计）", code: "047"),
    SubjectInfo(name: "广播电视学", code: "048"),
    SubjectInfo(name: "音乐学", code: "049"),
    SubjectInfo(name: "视觉传达设计", code: "050"),
    SubjectInfo(name: "环境设计", code: "051"),
    SubjectInfo(name: "数字媒体艺术", code: "052"),
    SubjectInfo(name: "法学", code: "053"),
    SubjectInfo(name: "土地资源管理", code: "054"),
    SubjectInfo(name: "公共事业管理", code: "055"),
    SubjectInfo(name: "行政管理", code: "056"),
    SubjectInfo(name: "土地整治工程", code: "057"),
    SubjectInfo(name: "应急管理", code: "058"),
    SubjectInfo(name: "思想政治教育", code: "059"),
    SubjectInfo(name: "计算机科学与技术", code: "060"),
    SubjectInfo(name: "网络工程", code: "061"),
    SubjectInfo(name: "信息安全", code: "062"),
    SubjectInfo(name: "空间信息与数字技术", code: "063"),
    SubjectInfo(name: "数据科学与大数据技术", code: "064"),
    SubjectInfo(name: "智能科学与技术", code: "065"),
    SubjectInfo(name: "测控技术与仪器", code: "066"),
    SubjectInfo(name: "自动化", code: "067"),
    SubjectInfo(name: "海洋科学", code: "068"),
    SubjectInfo(name: "海洋工程与技术", code: "069")
]