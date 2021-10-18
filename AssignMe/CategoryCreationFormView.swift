//
//  CategoryCreationFormView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/17/21.
//

import SwiftUI

struct CategoryCreationFormView: View {
    var body: some View {
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack() {
                Text("Category Entry")
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                Spacer()
            }
    
        }
    }
    
    
}

struct CategoryCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCreationFormView()
    }
}
