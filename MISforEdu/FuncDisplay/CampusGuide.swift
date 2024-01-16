//
//  CampusGuide.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI

struct CampusGuide: View {
    @State private var selectedLocation: String = ""
    var body: some View {
        GeometryReader{geo in
            let frame_size = geo.size.width * 0.9
            ZStack (alignment: .center){
                Image("WLmap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Rectangle()
                        .stroke(lineWidth: 10)
                        .fill(.ultraThinMaterial))
                    .frame(width: frame_size,height: frame_size)
                /*VStack (spacing: 50){
                    VStack(spacing: 50){
                        HStack(spacing: 50){
                            DoorButton()
                            DoorButton()
                            DoorButton()
                            DoorButton()
                        }
                        HStack(spacing: 50){
                            VStack(spacing: 50){
                                DoorButton()
                                DoorButton()
                            }
                            HStack(spacing: 50){
                                VStack(spacing: 50){
                                    DoorButton()
                                    DoorButton()
                                }
                                VStack(spacing: 50){
                                    DoorButton()
                                    DoorButton()
                                }
                            }
                        }
                    }
                    VStack {
                        DoorButton()
                        DoorButton()
                    }
                }*/
            }.frame(width: geo.size.width,height: geo.size.height)
        }
    }
}

struct CampusGuide_Previews: PreviewProvider {
    static var previews: some View {
        CampusGuide()
    }
}
/*
    func popout_message(location : String){
        @State var message=String("你选择了 \(location)")
        Text(message)
            .foregroundColor(.white)
            .font(.title)
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        message = ""
    }
}
*/

struct DoorButton: View {
    var body: some View {
        Button(
            action : {},
            label: {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 10)
            }
        )
    }
}
