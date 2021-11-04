//
//  CategoryEdit.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/3/21.
//

import SwiftUI

struct CategoryEdit: View {
    var body: some View {
        
        NavigationView{
            Text("hello world")
                .navigationTitle("Category Edit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                
                }
        }
        

    }
}

struct CategoryEdit_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEdit()
            .preferredColorScheme(.dark)//dark mode
        
    }
}
