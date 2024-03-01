//
//  FilterBar.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI


struct FilterBarProcessor : View{
    enum filter_type{
        case dot
        case bar
    }
    @State var toPresent : Bool = false
    let displayType : filter_type
    //@Environment(\.dismiss) private var dismiss
    let filter : FilterView //= FilterView(filter: PersonFilterItem)
    @State var capsules : [Int] = []
    var body: some View {
        GeometryReader{ geo in
            switch displayType {
            case .dot:
                Button(action: {
                    withAnimation {
                        capsules = []
                        capsules.append(capsules.count + 1)
                    }
                    toPresent = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(toPresent ? .gray : .green)
                }.disabled(toPresent)
                    .popover(isPresented: $toPresent,arrowEdge: .bottom) {
                        VStack {
                            FilterBar(capsules: $capsules, toPresent: $toPresent, filterView : filter
                                      //,Filter: PersonFilter()
                            )
                        }
                    }.frame(width: 600)
            case .bar:
                
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius:20.0)
                        .stroke()
                        .frame(width: geo.size.width * 0.6,height: 60)
                    ScrollView(.horizontal) {
                        Button(action: {
                            withAnimation {
                                capsules = []
                                capsules.append(capsules.count + 1)
                            }
                            toPresent = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(toPresent ? .gray : .green)
                        }.disabled(toPresent)
                            .popover(isPresented: $toPresent,arrowEdge: .bottom) {
                                VStack {
                                    FilterBar(capsules: $capsules, toPresent: $toPresent, filterView : filter
                                              //,Filter: PersonFilter()
                                    )
                                }
                            }.frame(width: geo.size.width * 0.6)
                    }
                }
                
            }
        }
    }
}

struct FilterBar: View {
    @Binding var capsules : [Int]
    @Binding var toPresent : Bool
    //let Filter :struct View
    //@Environment(\.dismiss) private var dismiss
    let rows = [GridItem(.flexible()),GridItem(.flexible())]
    let filterView : FilterView
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                if (capsules.count > 0){
                    LazyHGrid(rows: rows,spacing: 10){
                        ForEach(capsules, id: \.self) { num in
                            HStack {
                                Text(String(num)).frame(width: 20)
                                withAnimation(.spring()) {
                                    //FilterView(filter: filterItem)
                                    filterView
                                        .frame(width: 350, height: 60)
                                        .foregroundColor(.blue)
                                }
                                Button(action: {
                                    print(num)
                                    print(capsules.count)
                                    if (capsules.count > 1){
                                        capsules[num-1] = capsules.last!
                                        capsules.removeLast()
                                    }
                                    else{
                                        toPresent = false
                                    }
                                    
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.red)
                                }
                            }
                            .frame(width: 400)
                            .padding(.vertical, 10)
                        }
                        Button(action: {
                            withAnimation {
                                capsules.append(capsules.count + 1)
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                    }.frame(height: 150)
                }
            }
            .padding()
            HStack {
                Button(action :{toPresent = false}){
                    Label("返回", systemImage: "arrowshape.turn.up.left")
                }.padding(5)
                Button(action :{
                    //selectedOrder = tempOrder
                    toPresent = false}){
                        Label("确认", systemImage: "checkmark.circle")
                    }.padding(5)
            }
        }
    }
}

struct FilterBar_Previews: PreviewProvider {
    static var previews: some View {
        FilterBarProcessor(displayType: .dot, filter: FilterView(filter: Filters().PersonFilterItem))
        FilterBarProcessor(displayType: .bar, filter: FilterView(filter: Filters().PersonFilterItem))
    }
}
