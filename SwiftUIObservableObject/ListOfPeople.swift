//
//  People.swift
//  SwiftUIObservableObject
//
//  Created by Oskar Larsson on 2022-10-05.
//

import Foundation
import SwiftUI

class ListOfPeople: ObservableObject {
    
   @Published private var persons = [Person]()
    
    func addPerson(person: Person) {
        persons.append(person)
    }
    
    func getAllPersons() -> [Person]{
        return persons
    }
    
//    func removeItems(at offsets: IndexSet) {
//        persons.remove(atOffsets: offsets)
//    }
    
//    func removeAt(person: Person) {
//        persons.remove(at: person)
//    }
//
    func removeByID(person: Person) {
        // Creating new array with every member of array except the one passed in to function
        let updatedPersons = persons.filter() {$0.id != person.id }
        
        // setting old array to new array
        persons = updatedPersons
    }
    
    func getPersonAt(index: Int) -> Person? {
        return persons[index]
    }
    
    // Make a getIndex-function
}
