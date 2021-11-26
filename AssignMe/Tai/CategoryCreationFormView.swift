//
//  CategoryCreationFormView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/17/21.
//

import SwiftUI

struct CategoryCreationFormView: View {
    @State var categoryName: String = ""
    @State var currentColor: String = "red"
    @State var tabColor: Color = .red
    @EnvironmentObject var user: UserOld
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
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
                    // MARK: Add Button
                    Button("Add"){
                        
                        var found = false
                        for category in categories {
                            if(category.wrappedName == categoryName){
                                found = true
                            }
                        }
                        
                        if(!found) {
                            let cat = CategoryEntity(context: managedObjectContext)
                            cat.name = categoryName
                            cat.color = currentColor.lowercased()
                            try? managedObjectContext.save()
                            print("\(cat.wrappedName) added to core data.")
                        } else {
                            print("\(categoryName) already exists")
                        }
//                        self.presentation.wrappedValue.dismiss()
                    } //button
                    .frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal,2)
                    
                    Spacer()
                    
                } // end hstack
                
                HStack(){
                    Text("Name:")
                        .foregroundColor(.bright_maroon)
                    Spacer()
                }
                .padding(.horizontal)
                
                TextField("Enter Category Name...", text: $categoryName)
                    .font(.custom("Ubuntu-Regular", size: 16))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.bg_light)
                    .cornerRadius(10)
                
                HStack(){
                    Text("Color:")
                        .foregroundColor(.bright_maroon)
                    Spacer()
                }
                .padding(.horizontal)
                
                // MARK: Picker
                Picker("Color Options", selection: $currentColor) {
                    Text("Red").tag("red")
                    Text("Orange").tag("orange")
                    Text("Blue").tag("blue")
                    Text("Pink").tag("pink")
                    Text("Yellow").tag("yellow")
                }
                .padding(.horizontal)
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.bg_light)
                
                Spacer()
            } //vstack
            
        }
        .navigationBarHidden(true)
        
    }
}

//struct CategoryCreationFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCreationFormView()
//
//    }
//}

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
