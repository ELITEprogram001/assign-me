//
//  CategoryCreationFormView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/17/21.
//

import SwiftUI

struct CategoryCreationFormView: View {
    @State var categoryName: String = ""
    @State var currentColor: String = "Select Category Color..."
    @State var tabColor: Color = .red
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                HStack(){
                    Spacer()
                    Button(action:{
                    
                     
                        self.presentation.wrappedValue.dismiss()
                    },label:{
                        
                        Image(systemName: "arrow.backward.circle")
                        .frame(width: 60, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading, 8 )

                    })  //button
                    
                    Spacer()
                    Text("Category Entry")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        //.padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                    

                    Spacer()
                    Button("Add"){
                        let toAdd = Category(
                            name:categoryName,
                            color: tabColor)
                        user.categoryList.append(toAdd)
                        self.presentation.wrappedValue.dismiss()
                    } //button
                    .frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal,2)
                    
                    Spacer()
                    
                } //hstack
                
                Text("Name:")
                    .foregroundColor(.blue)
                TextField("    Enter Category Name...", text: $categoryName)
                    .padding(.horizontal, 1)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
                
                Text("Color:")
                    .foregroundColor(.blue)
                   
                Menu("\(currentColor)"){
                    //Text("hello")
                    Button(action:{currentColor = "Yellow";
                            tabColor = .yellow }, label:{
                        Text("Yellow")
                    })
                    Button(action:{currentColor = "Blue";
                            tabColor = .blue }, label:{
                        Text("Blue")
                        
                    })
                    Button(action:{currentColor = "Red";
                            tabColor = .red }, label:{
                        Text("Red")
                        
                    })
                    Button(action:{currentColor = "Green";
                            tabColor = .green}, label:{
                        Text("Green")
                        
                    })
                    Button(action:{currentColor = "Orange";
                            tabColor = .orange }, label:{
                        Text("Orange")
                        
                    })
                    Button(action:{currentColor = "Pink";
                            tabColor = .pink}, label:{
                        Text("Pink")
                        
                    })
                    Button(action:{currentColor = "Purple";
                            tabColor = .purple }, label:{
                        Text("Purple")
                            

                    })
                    .foregroundColor(.purple)
                } //menu
                .foregroundColor(.gray)
                Spacer()
            } //vstack
            
        }
        .navigationBarHidden(true)
        
    }
}
struct CategoryCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCreationFormView()
       
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
