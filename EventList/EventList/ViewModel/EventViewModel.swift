//
//  EventViewModel.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import Foundation
import Combine

final class EventViewModel: ObservableObject {
    
    private var allEvents: [Event] = []
    @Published var events: [Event] = []
    @Published var searchText = "" {
        didSet {
            filterResults()
        }
    }
    
    func loadEvents() {
        do {
            let container = try JsonReader.shared.load(fileName: "Events", type: EventContainer.self)
            allEvents = container.events ?? []
            events = allEvents
        } catch {
            print(error)
        }
    }
    
    func filterResults() {
        if searchText == "" {
            events = allEvents
        } else {
            events = allEvents.filter {
                ($0.city ?? "").lowercased().contains(searchText.lowercased())
            }
        }
    }
    
}
