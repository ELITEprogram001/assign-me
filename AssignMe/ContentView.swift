//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
    // Test Category
    var Mental_Health = Category(name:"Mental Health",color:"Blue")
    
    var body: some View {
        Text("Name of Category Mental Health: \(Mental_Health.name)")
            .padding()
        //Test Task
        let Meditate = Task(name:"Meditate",category:Mental_Health,description:"Take a breather.",difficulty:3, dueDate: Date(), dateCompleted: Date(), isOverdue:false )
        Text("Attributes Of Task Metidate: \(Meditate.listAttributes())")
            .padding()
        
        Text("This is a betterer test.")
            .padding()
        Text("I HATE tests.")
            .padding()
        Text("This is BESTEST test.(tai)")
        
        .padding()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
