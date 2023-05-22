//
//  DetailScreen.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 21/05/2023.
//

import SwiftUI
import Apollo

struct DetailScreen: View {
    
    var id: String
    var name: String
    var sku: String
    var price: Double
    var currency: String
    var imageURL: String
    var formattedPrice: String {
        String(format: "%.2f", price)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL)!) { phase in
                if let image = phase.image {
                    image.resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } else if phase.error != nil {
                    
                    Image(systemName: "questionmark")
                        .padding(.top, 40)
                    
                } else {
                    ProgressView()
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 40)
            
            Text("ID: \(id)")
                .font(.headline)
                .padding(5)
            Text("Name: \(name)")
                .font(.subheadline)
                .padding(5)
            Text("SKU: \(sku)")
                .font(.subheadline)
                .padding(5)
            HStack{
                Text("£ \(formattedPrice)")
                Text("\(currency)")
            }.padding(.leading, 5)
                            
            Spacer()
        }.padding(10)
        .navigationTitle("Product Detail")
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(id: "", name: "", sku: "", price: 0, currency: "", imageURL: "")
    }
}



