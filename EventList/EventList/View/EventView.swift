//
//  EventView.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import SwiftUI

struct EventView: View {
    
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(event.name ?? "")
                .fontWeight(.bold)
            Text("\(event.city ?? "") -  \(event.venueName ?? "")")
            Text("\(event.price ?? 0)$")
                .foregroundColor(.green)
            Text(event.date ?? "")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        let mockEvent = Event(id: 4422829, name: "Backstreet Boys", venueName: "Freedom Mortgage Pavilion", city: "Camden", price: 23, distanceFromVenue: 121162.390908814, date: "Jul 16 2020", distanceFromValue: nil)
        EventView(event: mockEvent)
            .previewLayout(.sizeThatFits)
    }
}
