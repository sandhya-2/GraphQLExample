//
//  ProductRowView.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 22/05/2023.
//

import SwiftUI

struct ProductRowView: View {
    
    var id: String
    var productName: String
    var sku: String
    var price: Double
    var currency: String
    var image: String
    
    
    var body: some View {
        NavigationLink(destination: DetailScreen(id: id, name: productName, sku: sku, price: price, currency: "", imageURL: image)) {
            Text(productName)
        }
            
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(id: "", productName: "", sku: "", price: 10.00, currency: "", image: "")
    }
}


