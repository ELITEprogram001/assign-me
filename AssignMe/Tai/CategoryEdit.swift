//
//  CategoryEdit.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/3/21.
//

import SwiftUI

struct CategoryEdit: View {
    @State private var categoryName: String = ""
    @State private var color: String = ""
    @State private var difficulty: String = ""
    var body: some View {
        
        
        //NavigationView{
        ZStack {
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all) //for gray mode
            VStack(spacing: 15){
                    
                    
                HStack(){
                    Spacer()
                    Text("Category Edit")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                    BlueButton(title: "Save")
                        .padding(.horizontal, 10)
                } //hstack
                        
                    
                    
                Text("Name:")
                    .foregroundColor(.blue)
                TextField("   Enter Category Name", text: $categoryName)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
              
                Text("Description:")
                    .foregroundColor(.blue)
                TextField("   Enter Color", text: $color)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
                Spacer()
                //DifficultyView(rating: $difficulty)
                    
                        //
                        //
                        ////                Menu("Changed Color"){
                        ////                    Button("Red"){
                        //                //                        print, selection: ("red")
                        ////                    }
                        ////                    Button("Green"){
                        ////                        print("red")
                        ////                    }
                        ////                    Button("Blue"){
                        ////                        print("red")
                        ////                    }
                        ////                }
                        //            }
                        
                    
            }
        } //vstack
            
            //.navigationTitle("Category Edit")
        //} //NavigationView
        
    } //body
} //category edit struc

struct CategoryEdit_Previews: PreviewProvider {
    static var previews: some View {

        CategoryEdit().preferredColorScheme(.dark)

    }
}


private struct BlueButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .frame(width:60, height: 40)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
