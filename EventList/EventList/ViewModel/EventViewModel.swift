//
//  EventViewModel.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import Foundation
import Combine

final class EventViewModel: ObservableObject {
    
    private var allEvents: [EventContainer] = []
    @Published var events: [EventContainer] = []
    @Published var searchText = "" {
        didSet {
            filterResults()
        }
    }
    
    func loadEvents() {
        do {
            let container = try JsonReader.shared.load(fileName: "Events", type: EventContainer.self)
            allEvents = container.children ?? []
            events = allEvents
        } catch {
            print(error)
        }
    }
    
    func filterResults() {
        if searchText == "" {
            events = allEvents
        } else {
            events = allEvents.compactMap { event in
                let result = (event.children ?? []).compactMap { child -> EventContainer in
                    var filteredEvents = [Event]()
                    filteredEvents = (child.events ?? []).filter {
                        ($0.city ?? "").lowercased().contains(searchText.lowercased())
                    }
                    
                    return EventContainer(id: child.id, name: child.name, events: filteredEvents, children: [])
                    
                }.filter { !($0.events ?? []).isEmpty }

                return EventContainer(id: event.id, name: event.name, events: [], children: result)
                
            }.filter { !($0.children ?? []).isEmpty }
        }
    }
    
}
