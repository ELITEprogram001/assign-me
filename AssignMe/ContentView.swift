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
    var Test_Cat = Category(name: "Fitness", color: "red")
    
    var body: some View {
        //CategoryCard(category:Test_Cat)
        //CategoryCard(category:Mental_Health)
        Text("Hello")

    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
