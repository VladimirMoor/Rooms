//
//  ContentView.swift
//  Rooms
//
//  Created by Vladimir on 19.05.2021.
//

import SwiftUI

struct ContentView: View {
    var rooms: [Room] = testData
    var body: some View {
        NavigationView {
        List(rooms) { room in
            RoomCell(room: room)
        }.navigationBarTitle("Rooms")
      }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}


struct RoomCell: View {
    
    var room: Room
    
    var body: some View {
        NavigationLink( destination: RoomDetail(room: room)) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
