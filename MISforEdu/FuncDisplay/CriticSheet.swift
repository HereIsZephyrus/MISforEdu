//
//  CriticSheet.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticSheet: View {
    let question : [String]
    let questionNum : Int
    let editable : Bool
    @Binding var rating : [Int]
    @State var showAlert : Bool = false
    //@State var rating : [Int]
    init(questionList : [String],ratingSheet : Binding<[Int]>,editable : Bool){
    //init(questionList : [String]){
        self.question = questionList
        self._rating = ratingSheet
        //self.rating = Array(repeating: 0, count: questionList.count)
        self.questionNum = questionList.count
        self.editable = (editable == false)
    }
    var body: some View {
        GeometryReader { geometry in
                
                ScrollView{
                    VStack {
                        ForEach(0..<questionNum){ item in
                            HStack {
                                Text(question[item])
                                    .font(.title3)
                                    .frame(width: geometry.size.width*0.65,alignment: .leading)
                                    .padding(.leading,10)
                                HStack {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: index <= rating[item] ? "star.fill" : "star")
                                            .foregroundColor(index <= rating[item] ? .yellow : .gray)
                                            .onTapGesture {
                                                if editable{
                                                    rating[item] = index
                                                }
                                                else{
                                                    showAlert = true
                                                }
                                            }
                                    }
                                    
                                }.frame(width: .infinity,alignment: .trailing)
                                    .font(.title3)
                                    .padding()
                                    .background()
                            }
                        }
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .shadow(radius: 1)
                        )
                    }.alert(isPresented: $showAlert, content: {
                        Alert(title: Text("您已提交评价,请先点击修改按钮"), primaryButton: .default(Text("好的"), action: {showAlert = false}), secondaryButton: .default(Text("取消"), action: {showAlert = false}))
                    })
                }
        }
    }

}
/*
struct CriticSheet_Previews: PreviewProvider {
    @State var rating = [Int]()
    static var previews: some View {
        //CriticSheet(questionList: teaching_critic_question, ratingSheet: $rating)
        CriticSheet(questionList: teaching_critic_question)
    }
}
*/
