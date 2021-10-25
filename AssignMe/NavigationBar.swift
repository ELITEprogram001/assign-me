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
            tabItem{
                Label("menu",system.Image: "list.dash")
            }
        }
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
