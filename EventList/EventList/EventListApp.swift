//
//  EventListApp.swift
//  EventList
//
//  Created by Eslam Shaker on 20/06/2022.
//

import SwiftUI

@main
struct EventListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventListView(viewModel: EventViewModel())
            }
        }
    }
}
