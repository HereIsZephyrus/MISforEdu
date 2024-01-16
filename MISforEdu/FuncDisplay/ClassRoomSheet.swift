//
//  SelectClassroom.swift
//  MISforEdu
//
//  Created by ChanningTong on 1/19/24.
//

import SwiftUI

struct ClassRoomSheet: View {
	@Binding var isPresent: Bool
	@State var selected = ""
	@State var floor : Int = 1
	let unavaliableClassroom = ["pb1-113","pb1-106"]
    var body: some View {
		let ButtonStateChecker = {
			(current : String) -> roombutton_state in
			return ButtonStateProcessor(current_button: current, selected_button: selected, unavaliable_buttonlist: unavaliableClassroom)
		}
        GeometryReader{geo in
			VStack {
				VStack(alignment: .trailing) {
					HStack {
						VStack{
							Text("公教二")
								.font(.largeTitle)
								.frame(width: 200)
							Spacer()
							Text("公教一")
								.font(.largeTitle)
								.frame(width: 200)
						}.frame(height: geo.size.height*0.5)
							.padding(.leading,geo.size.width * 0.1)
							VStack{
								let scale = geo .size .width * 0.6
								FloorMap(scale: scale,fliptext:false,checker: ButtonStateChecker,selected: $selected,floor: $floor)
								FloorMap(scale: scale,fliptext:true,checker: ButtonStateChecker,selected: $selected,floor: $floor)
									.scaleEffect(x :1,y : -1)
							}
					}.frame(width: geo.size.width*0.7)
					HStack(spacing: 200) {
						Button {
							floor += 1
						} label: {
							Text("上楼")
								.font(.title2)
								//.foregroundColor(.black)
								.padding(10)
								.background(
									RoundedRectangle(cornerRadius: 10)
										.stroke(.cyan)
								)
						}.disabled(floor >= 5)
						Button {
							floor -= 1
						} label: {
							Text("下楼")
								.font(.title2)
								//.foregroundColor(.black)
								.padding(10)
								.background(
									RoundedRectangle(cornerRadius: 10)
										.stroke(.cyan)
								)
						}.disabled(floor <= 1)
					}
				}
				VStack{
					Button {
						isPresent = false
					} label: {
						Text("取消")
							.font(.title)
							.foregroundColor(.black)
							.padding(10)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.pink)
									.opacity(0.5)
							)
					}.frame(width: geo.size.width * 0.5,alignment: .leading)
					Button {
						isPresent = false
					} label: {
						Text("确认")
							.font(.title)
							.foregroundColor(.black)
							.padding(10)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(.cyan)
									.opacity(0.5)
							)
					}.frame(width: geo.size.width * 0.5,alignment: .leading)
				}.padding(.top,-100)
					
			}
        }
    }
	func ButtonStateProcessor(current_button : String, selected_button : String, unavaliable_buttonlist : [String]) -> roombutton_state{
		if (unavaliable_buttonlist.contains(current_button))
			{
				return .unavaliable
			}
		if (selected_button == current_button)
			{
				return .selected
			}
			return .avaliable
	}
}

struct FloorMap: View {
    let scale : CGFloat
    let fliptext : Bool
	let checker : (String) -> roombutton_state
	@Binding var selected : String
	@Binding var floor : Int
    var body: some View {
        ZStack {
            Image("ClassMap")
                .resizable()
                .frame(width:scale,height: scale)
			HStack(spacing : -scale * 0.216) {
				VStack(spacing: 0) {
					RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)10",bWidth: 0.17,bHeight:0.162)
					RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)09",bWidth: 0.17,bHeight:0.162)
				}.padding(.leading,scale * -0.01)
					.padding(.top,scale * 0.02)
				VStack(spacing: scale * 0.345) {
					VStack(spacing: scale * 0.067) {
						HStack(spacing: 0) {
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)13",bWidth: 0.163,bHeight:0.134)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)15",bWidth: 0.098,bHeight:0.134)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)17",bWidth: 0.155,bHeight:0.134)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)19",bWidth: 0.106,bHeight:0.134)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)20",bWidth: 0.183,bHeight:0.134)
						}.padding(.leading,scale * 0.27)
						HStack(spacing: 0) {
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)12",bWidth: 0.065,bHeight:0.104)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)14",bWidth: 0.145,bHeight:0.104)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)16",bWidth: 0.155,bHeight:0.104)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)18",bWidth: 0.1556,bHeight:0.104)
						}.padding(.leading,scale * 0.08)
					}
					VStack(spacing: scale * 0.066) {
						HStack(spacing: 0) {
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)07",bWidth: 0.1,bHeight:0.104)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)05",bWidth: 0.155,bHeight:0.104)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)03",bWidth: 0.13,bHeight:0.104)
						}.padding(.leading,scale * 0.18)
						HStack(spacing: 0) {
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)08",bWidth: 0.164,bHeight:0.12)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)06",bWidth: 0.152,bHeight:0.12)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)04",bWidth: 0.107,bHeight:0.12)
							RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)02",bWidth: 0.155,bHeight:0.12)
						}.padding(.leading,scale * 0.14)
					}
				}.padding(.top,scale * 0.01)
				RoomButton(selected: $selected, checker : checker,scale: scale, fliptext: fliptext,info: "\(floor)01",bWidth: 0.226,bHeight:0.173)
					.padding(.top,scale * 0.07)
					.padding(.leading,scale * 0.01)
			}.padding(.leading,4)
        }
		.frame(width:scale,height: scale)
    }
}

struct RoomButton: View {
	@Binding var selected : String
	let checker : (String) -> roombutton_state
	let scale : CGFloat
	let fliptext : Bool
	let info : String
	let bWidth : CGFloat
	let bHeight : CGFloat
	var body: some View {
		let buildingString = fliptext ? "pb1-" : "pb2-"
		let current = buildingString + info
		let buttonState = checker(current)
		let signal = fliptext ? CGFloat(-1) :CGFloat(1)
		let buttonColor = getButtonColor(state: buttonState)
		Button {
			//buttonColor = Color.red
			selected = current
			print(selected)
		} label: {
			Text("\(info)")
				.foregroundColor(.white)
				.padding()
				.frame(width: scale * bWidth,height: scale * bHeight)
				.background(
					ZStack {
						Rectangle()
							.stroke(lineWidth: 2)
							.fill(.black)
						Rectangle()
							.fill(buttonColor)
							.opacity(0.4)
					})
				.scaleEffect(x : 1,y:signal)
				.multilineTextAlignment(.center)
		}.frame(width: scale * bWidth,height: scale * bHeight)
			.disabled(buttonState == .unavaliable)
	}
	func getButtonColor (state : roombutton_state) -> Color{
		switch state {
		case .avaliable :
			return .blue
		case .unavaliable :
			return .gray
		case .selected:
			return .red
		}
	}
}

struct SelectClassroom_Previews: PreviewProvider {
	static var previews: some View {
		ClassRoomSheet(isPresent: .constant(true))
	}
}
