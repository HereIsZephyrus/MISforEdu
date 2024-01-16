//
//  ReviewCheck.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticCheckView: View {
    struct Course {
            let name: String
            let grade: String
            let credit: Double
        }
        
        let courses: [Course] = [
            Course(name: "数学", grade: "A+", credit: 4.0),
            Course(name: "英语", grade: "A", credit: 3.0),
            Course(name: "物理", grade: "B", credit: 3.5),
            Course(name: "化学", grade: "A-", credit: 3.5),
            Course(name: "历史", grade: "B+", credit: 2.5)
        ]
        
        var totalCredits: Double {
            courses.reduce(0) { $0 + $1.credit }
        }
        
        var totalGradePoints: Double {
            courses.reduce(0) { $0 + gradePoint(for: $1.grade) * $1.credit }
        }
        
        func gradePoint(for grade: String) -> Double {
            // 自定义成绩和绩点的对应关系
            switch grade {
            case "A+":
                return 4.0
            case "A":
                return 4.0
            case "A-":
                return 3.7
            case "B+":
                return 3.3
            case "B":
                return 3.0
            case "B-":
                return 2.7
            case "C+":
                return 2.3
            case "C":
                return 2.0
            case "C-":
                return 1.7
            case "D+":
                return 1.3
            case "D":
                return 1.0
            case "D-":
                return 0.7
            default:
                return 0.0
            }
        }
        
        var body: some View {
            List(courses, id: \.name) { course in
                VStack(alignment: .leading) {
                    Text(course.name)
                        .font(.headline)
                    Text(course.grade)
                        .foregroundColor(.secondary)
                    Text("绩点: \(gradePoint(for: course.grade))")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("成绩查看")
            .onAppear {
                let gpa = totalGradePoints / totalCredits
                print("学分绩点: \(gpa)")
            }
        }
}

struct CriticCheck_Previews: PreviewProvider {
    static var previews: some View {
        CriticCheckView()
    }
}
