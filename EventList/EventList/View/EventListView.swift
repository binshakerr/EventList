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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
