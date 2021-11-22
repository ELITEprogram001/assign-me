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
    var category: Category
    var catIndex: Int
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
    
    init(category: Category, catIndex: Int){
        self.category = category
        self.catIndex = catIndex
        _categoryName = State(initialValue: category.name)
        _color = State(initialValue: "red")
    }
    
    var body: some View {
        
        
        //NavigationView{
        ZStack {
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)//for gray mode
            VStack(spacing: 15){
                    
                    
                HStack(){
                    Spacer()
                    Button("Back"){
                        self.presentation.wrappedValue.dismiss()
                    }
                    //.buttonStyle(FilledButton(isActive: false))
                    .frame(width: 60, height: 40)
                    .padding(.leading,5)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Spacer()
                    Text("Category Edit")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(
                        action:{
                            user.categoryList[catIndex].name = categoryName
                            user.categoryList[catIndex].color = .blue
                            self.presentation.wrappedValue.dismiss()},
                        label:{Text("Save")
                            .bold()
                            .frame(width:60, height: 40)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    ) //Button END
                    Spacer()
                } //hstack
            
                        
                    
                    
                Text("Name:")
                    .foregroundColor(.blue)
                TextField("   Enter Category Name", text: $categoryName)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
              
                Text("Color:")
                    .foregroundColor(.blue)
                   
                Menu("\(color)"){
                    //Text("hello")
                    Button(action:{color="Yellow" }, label:{
                        Text("Yellow")
                    })
                    Button(action:{color="Blue" }, label:{
                        Text("Blue")
                        
                    })
                    Button(action:{color="Red" }, label:{
                        Text("Red")
                        
                    })
                    Button(action:{color="Green" }, label:{
                        Text("Green")
                        
                    })
                    Button(action:{color="Orange" }, label:{
                        Text("Orange")
                        
                    })
                    Button(action:{color="Indigo" }, label:{
                        Text("Indigo")
                        
                    })
                    Button(action:{color="Violet" }, label:{
                        Text("Violet")
                            

                    })
                    .foregroundColor(.purple)
                } //menu
                .foregroundColor(.gray)
                Spacer()
                    
            }
        } //vstack
        .navigationBarTitle("")
        .navigationBarHidden(true)
            //.navigationTitle("Category Edit")
        //} //NavigationView
        
    } //body
} //category edit struc
/*
struct CategoryEdit_Previews: PreviewProvider {
    static var previews: some View {

        CategoryEdit().preferredColorScheme(.dark)

    }
}
*/


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
