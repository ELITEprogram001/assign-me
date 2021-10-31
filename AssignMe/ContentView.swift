//
//  ContentView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 10/13/21.
//

import SwiftUI
struct ContentView: View {
    // Test Category
    var Mental_Health = Category(name:"Mental Health",color:Color.red)
    var testing=true
    var user:User
    init()
    {
        user=User()
        user.addCategory(cat:Mental_Health)
    }
    var body: some View {
    
        if (testing)
        {

            NavigationView {
                NavigationLink(destination: TaskCreationFormView(user:user)) {
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
