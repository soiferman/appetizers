//
//  ProductError.swift
//  Appetizers
//
//  Created by Max Soiferman on 26/9/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
