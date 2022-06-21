//
//  EventViewModel.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import Foundation
import Combine

final class EventViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    
    func loadEvents() {
        do {
            let container = try JsonReader.shared.load(fileName: "Events", type: EventContainer.self)
            events = container.events ?? []
        } catch {
            print(error)
        }
    }
    
}
