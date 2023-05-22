//
//  ContentView.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 20/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ProductViewModel
    @State var isErrorOccurred: Bool = false
    
    var body: some View {
        
        NavigationStack(){
            VStack {
                if viewModel.customError != nil {
                    ProgressView().alert(isPresented: $isErrorOccurred){
                        Alert(title: Text("Oops Something Went Wrong!"), message: Text(viewModel.customError?.localizedDescription ?? ""), dismissButton: .default(Text("Okay")))
                    }
                } else {
                    
                    List{
                        ForEach(viewModel.productList, id: \.uid){ product in
                            
                            ProductRowView(id: product.uid, productName: product.name ?? "", sku: product.sku ?? "", price: product.priceRange.minimumPrice.regularPrice.value ?? 0, currency: product.priceRange.minimumPrice.regularPrice.currency?.rawValue ?? "", image: product.image?.url ?? "")
                        }
                    }
                }
            }.onAppear{
                viewModel.getProductList()
                if viewModel.customError != nil {
                    isErrorOccurred = true
                } else {
                    isErrorOccurred = false
                }
                
            }.navigationTitle("Product List")
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProductViewModel())
    }
}
