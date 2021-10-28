//
//  NavigationBar.swift
//  AssignMe
//
//  Created by Tai on 10/24/21.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        TabView{
            Text("first")
                .tabItem{
                    Text("hello world")
                }
        }
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
