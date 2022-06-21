//
//  EventListView.swift
//  EventList
//
//  Created by Eslam Shaker on 21/06/2022.
//

import SwiftUI

struct EventListView: View {
    
    @ObservedObject var viewModel: EventViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.events, id: \.self) { container in
                Section(container.name ?? "") {
                    ForEach(container.children ?? [], id: \.self) { innerContainer in
                        ForEach(innerContainer.events ?? [], id: \.self) { event in
                            EventView(event: event)
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.loadEvents()
        }
        .navigationTitle("Concerts")
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(viewModel: EventViewModel())
    }
}
