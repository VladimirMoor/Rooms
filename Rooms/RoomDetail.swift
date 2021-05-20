//
//  RoomDetail.swift
//  Rooms
//
//  Created by Vladimir on 20.05.2021.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed: Bool = false
    var body: some View {
        ZStack(alignment: .topLeading)
         {
        Image(room.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .navigationBarTitle(Text(room.name), displayMode: .inline)
            .onTapGesture {
                withAnimation() { self.zoomed.toggle() }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if room.hasVideo && !zoomed {
            Image(systemName: "video.fill")
                .font(.title)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .transition(.move(edge: .leading))
            }
        }
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                RoomDetail(room: testData[0])
            }
            NavigationView {
                    RoomDetail(room: testData[1])
            }
        }
    }
}
