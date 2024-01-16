//
//  CriticSheet.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/18/24.
//

import SwiftUI

struct CriticSheet: View {
    @State private var rating = [Int](repeating: 0, count: 11)

    var question=[
"""
言行模范、依法执教；严慈相济、关爱学生
""",
"""
我能感受到老师课前准备充分，很重视课程教学。
""",
"""
老师能倾听我的提问、质疑、意见与建议，并给予耐心细致的回答。
""",
"""
老师明确告诉我本课程在知识结构及专业学习中的地位；我能了解到学这门课的目的，清楚教学计划、课程重点及考核与评价方法。
""",
"""
上课的内容知识性强，有时代感，老师对教学内容怀有激情；通过老师的讲述，我能系统而全面的把握教学内容；课堂时间安排合理、高效。
""",
"""
老师布置作业适中，反馈及时；对作业的要求明确而具体，批改与反馈及时，评分公正；老师对考试作弊采取了合理的预防。
""",
"""
老师普通话教学（外语课程语音语调标准），声音洪亮，富有激情，举止得体。
""",
"""
授课方式灵活多样，板书规范，多媒体资源在教学中应用得当。
""",
"""
老师上课绘声绘色，让我始终保持上课的兴趣；老师鼓励我积极参与到课堂活动中并能提出问题，课堂问题有效的给我提供了自学和独立客观的思考机会。
""",
"""
我了解课程与学科的关系，能阐述本门课程的主要内容和中心问题，并具有一定的应用能力。
""",
"""
这门课程启发性强，引发我思考，加深了我对这门课程研究对象的兴趣，激发了我的创新意识。
""",
"""
老师提供的补充材料实用性强，课后答疑耐心细致，对我学习帮助很大。
"""]
    var body: some View {
        GeometryReader { geometry in
                
                ScrollView{
                    VStack {
                        ForEach(0..<11){ item in
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
                                                rating[item] = index
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
                    }
                }
        }
    }

}

struct CriticSheet_Previews: PreviewProvider {
    static var previews: some View {
        CriticSheet()
    }
}
