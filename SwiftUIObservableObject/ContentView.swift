//
//  ContentView.swift
//  SwiftUIObservableObject
//
//  Created by Oskar Larsson on 2022-10-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listOfPeople = ListOfPeople()
    @State var showPopup = false

    
    var body: some View {
        
        ZStack {
            VStack {
                
                AddPersonView(listOfPeople: listOfPeople, showPopup: $showPopup)
                PeopleList(listOfPeople: listOfPeople)
            }
            if showPopup {
                AddPersonPopup(listOfPeople: listOfPeople, showPopup: $showPopup)
            }
            
        }
    }
}

struct AddPersonPopup: View {
    @ObservedObject var listOfPeople: ListOfPeople
    @State var name = ""
    @State var age = ""
    @Binding var showPopup: Bool
    
    var body: some View {
        VStack {
            
            Spacer()
            Text("Enter your details")
                .font(.title)
                .bold()
            Spacer()
            VStack(alignment: .leading) {
                Text("Name:")
                TextField("Namn", text: $name)
                    .padding() // Padding inside textfield
                    .background(.white)
                    .cornerRadius(7)
                Text("Age:")
                TextField("", text: $age)
                    .padding() // Padding inside textfield
                    .background(.white)
                    .cornerRadius(7)
            }
            .padding() // Padding outside textfield & text
            
            Spacer()
            Button(action: {
                
                listOfPeople.addPerson(person: Person(name: name, age: age))
                showPopup = false
                print("knapp tryckt")
                
            }, label: {
                Text("Add person")
                    .bold()
                    .font(.title2)
                
            })
                .padding(15)
                .frame(width: 200)
                .background(.yellow)
                .foregroundColor(.black)
                .cornerRadius(7)
                .padding(.bottom, 15)
        }.background(.ultraThinMaterial)
            .cornerRadius(7)
            .padding()
        
        
    }
    
}

struct AddPersonView: View {
    
    @ObservedObject var listOfPeople: ListOfPeople
    @Binding var showPopup: Bool
    
    var body: some View {
        
        Spacer()
        Button(action: {
            
            showPopup = true
            print("knapp tryckt")
            
        }, label: {
            Text("Add person")
                .bold()
                .font(.title2)
            
        })
            .padding(15)
            .frame(width: 200)
            .background(.yellow)
            .foregroundColor(.black)
            .cornerRadius(7)
            .padding(.bottom, 15)
        
    }
    
}



struct PeopleList: View {
    
    @ObservedObject var listOfPeople: ListOfPeople
    
   @State var index = 0
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Persons: ")
                .font(.largeTitle)
            
           
            ForEach(listOfPeople.getAllPersons(), id: \.id) {
                person in
                
                ZStack {
                    
                    Text("\(person.name), \(person.age)")
                        .padding(20)
                        .foregroundColor(.black)
                        .font(.title3)
                    
                    
                    
                    HStack {
                        Button(action: {
                            //ListOfPeople.getPersonAt(0)
                            //listOfPeople.removeAt(index:)

                            listOfPeople.removeByID(person: person)
                            
                            print("kryss")
                        }, label: {
                            Text("X")
                        }).font(.title2.bold()).foregroundColor(.black)
                        
                    }.frame(maxWidth: .infinity, alignment: .trailing).padding()
                    
                }.frame(maxWidth: (.infinity))
                    .background(.yellow).cornerRadius(7)
            
                
                
            }
            Spacer() // Pushing cards to the top
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).padding()
        .background(.ultraThinMaterial).cornerRadius(7)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
