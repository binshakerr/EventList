//
//  EventContainer.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import Foundation

struct EventContainer: Codable {
    let id: Int?
    let name: String?
    let events: [Event]?
    let children: [EventContainer]?
}
