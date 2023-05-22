//
//  ProductViewModel.swift
//  ApolloGraphQL
//
//  Created by Sandiya on 21/05/2023.
//

import Foundation
import Apollo

class ProductViewModel: ObservableObject {
    
    @Published var productList: [GetProductsQuery.Data.CategoryList.Product.Item] = []
    @Published var customError: NetworkError?
    
    func getProductList(){
        Network.shared.apollo.fetch(query: GetProductsQuery()){
            result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    if let products = graphQLResult.data?.categoryList?.first??.products?.items?.compactMap({$0}) {
                        self.productList = products
                    }
                }
                print("Success")
            case .failure(let error):
                self.customError = self.parseNetworkError(error)
                print(error.localizedDescription)
                
            }
        }
    }
    
    private func parseNetworkError(_ error: Error) -> NetworkError {
        if let apolloError = error as? Apollo.ApolloErrorInterceptor {
                switch apolloError {                
                default:
                    NetworkError.parsingError
                }
            }
            return NetworkError.invalidURL
        }
}

