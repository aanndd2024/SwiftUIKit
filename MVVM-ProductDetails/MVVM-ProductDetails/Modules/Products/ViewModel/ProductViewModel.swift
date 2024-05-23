//
//  ProductViewModel.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 23-05-2024.
//

import Foundation

final class ProductViewModel {
    var product:[Product] = [] 
    var eventHandler: ((_ event:Event) -> Void)?//Data Binding Closure
    
    func fetchProduct() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.product = products
                self.eventHandler?(.dataReceived)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataReceived
        case error(Error?)
    }
}
