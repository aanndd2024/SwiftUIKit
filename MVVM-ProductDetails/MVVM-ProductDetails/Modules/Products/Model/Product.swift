//
//  Product.swift
//  MVVM-ProductDetails
//
//  Created by Anand Yadav on 22-05-2024.
//

import Foundation

struct Product: Decodable {
    var id:Int
    var title:String
    var price:Float
    var description:String
    var category:String
    var image:String
    var rating:Rating
}

struct Rating:Decodable {
    var rate: Float
    var count:Int
}


//"id": 1,
//    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
//    "price": 109.95,
//    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
//    "category": "men's clothing",
//    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
//    "rating": {
//      "rate": 3.9,
//      "count": 120
//    }
