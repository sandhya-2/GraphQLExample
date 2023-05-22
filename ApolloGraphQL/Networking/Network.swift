//
//  Network.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 20/05/2023.
//

import Foundation
import Apollo

class Network {    
    static let shared = Network()
        
    private(set) lazy var apollo: ApolloClient = {
        let url = URL(string: APIEndpoints.baseURL)!
        return ApolloClient(url: url)
    }()
}
