//
//  Person.swift
//  SwiftUIObservableObject
//
//  Created by Oskar Larsson on 2022-10-05.
//

import Foundation

struct Person : Identifiable {
    
    var id = UUID()
    var name: String
    var age: String
}
