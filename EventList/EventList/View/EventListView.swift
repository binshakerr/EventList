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
            ForEach(viewModel.events, id: \.self) { event in
                EventView(event: event)
            }
        }
        .listStyle(.grouped)
        .searchable(text: $viewModel.searchText)
        .padding()
        .onAppear {
            viewModel.loadEvents()
        }
        .navigationTitle("Events")
    }
}

struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView(viewModel: EventViewModel())
    }
}
