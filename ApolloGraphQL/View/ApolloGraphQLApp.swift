//
//  ApolloGraphQLApp.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 20/05/2023.
//

import SwiftUI

@main
struct ApolloGraphQLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ProductViewModel())
        }
    }
}
