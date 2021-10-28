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
    var testing=true
    var body: some View {
        /*
        NavigationView {
                    NavigationLink(destination: CategoryCreationFormView()){
                        Text("Calendar View")
                    }
        }
        */
        if (testing)
        {

            NavigationView {
                        NavigationLink(destination: CategoryCreationFormView()) {
                            Text("PUSH")
                                .foregroundColor(Color.black)
                        }
            }
            
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
