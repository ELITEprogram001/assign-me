//
//  FilterMenu.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/25/21.
//

import SwiftUI
struct FilterMenu: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]     //filter by category so we need to read the category from other view.
    
    
    @State private var selectedColor = "Red"
    
    var body: some View {
        ZStack{
            Color(red: 20/255, green: 20/255, blue: 20/255).edgesIgnoringSafeArea(.all)
            VStack{
                
                Picker("Please choose a choose", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("You selected: \(selectedColor)")
            } //vstack
        } //ZStack
        
    } // body
}

struct FilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenu().preferredColorScheme(.dark)
    }
}
