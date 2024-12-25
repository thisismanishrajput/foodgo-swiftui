//
//  Burger.swift
//  Foodgo
//
//  Created by Manish Singh on 25/12/24.
//

import Foundation

struct Burger: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let imageName: String
    let rating: Double
}
