//
//  AttendView.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI


struct CourseDetail: View {
    let course: oldCourse

    var body: some View {
        VStack {
            Text("Course Detail")
                .font(.title)
                .padding()

            Text("Name: \(course.name)")
            Text("Grade: \(course.grade)")
            Text("Credit: \(course.credit)")
            
            Spacer()
        }
        .padding()
    }
}

struct CourseRow: View {
    let course: oldCourse
    @Binding var isSelected: Bool
    @State var showDetail : Bool = false
    init(course : oldCourse, isSelected : Binding<Bool>){
        self._isSelected = isSelected
        self.course = course
    }
    var body: some View {
        
        HStack {
            Button {
                showDetail.toggle()
                print(showDetail)
            } label: {
                Text(course.name)
            }.sheet(isPresented: $showDetail, content: {
                CourseDetail(course: course)
            })
            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isSelected ? .green : .gray)
                .onTapGesture {
                    isSelected.toggle()
                }
        }
    }
}

struct AttendView: View {
    @State private var courses: [oldCourse] = [
            oldCourse(name: "Math", grade: "A", credit: 3.0),
            oldCourse(name: "Science", grade: "B", credit: 4.0),
            oldCourse(name: "History", grade: "A-", credit: 3.5),
            oldCourse(name: "English", grade: "B+", credit: 3.0)
        ]
    @State private var selectedCourse: oldCourse?
    @State private var showConfirmation = false
    var body: some View {
        GeometryReader{geo in
            NavigationStack{
                VStack {
                    Text("Choose Your Courses")
                        .font(.title)
                        .padding()
                    VStack {
                        List(courses) { course in
                                CourseRow(course: course, isSelected: $courses[getIndex(for: course)].isSelected)
                        }
                    }
                }.frame(height: geo.size.height * 0.5)
                Button("确认") { showConfirmation = true}.padding()
            }
            .alert(isPresented: $showConfirmation) {
                raiseConfirm()
            }
        }
    }
    private func raiseConfirm() -> Alert{
        let confirmButton = Alert.Button.default(Text("确认")) {
            for course in courses {
                print(String(course.isSelected))
            }
        }
        return Alert(
            title: Text("选课信息确认"),
            message: Text("你确认要选这些课吗?"),
            primaryButton: confirmButton,
            secondaryButton: .cancel(Text("取消")))
    }
    private func getIndex(for course: oldCourse) -> Int {
        guard let index = courses.firstIndex(where: { $0.id == course.id }) else {
            fatalError("Course not found")
        }
        return index
    }
}

struct AttendView_Previews: PreviewProvider {
    static var previews: some View {
        AttendView()
    }
}
