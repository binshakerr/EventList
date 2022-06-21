//
//  Event.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import Foundation

struct Event: Codable, Hashable, Identifiable {
    let id: Int?
    let name, venueName, city: String?
    let price: Int?
    let distanceFromVenue: Double?
    let date: String?
    let distanceFromValue: Double?
}
