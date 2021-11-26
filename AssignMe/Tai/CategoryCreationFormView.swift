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
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(){
                Spacer()
                
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 40, height: 30)
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    } // end label zstack
                })  //button
                
                Spacer()
                
                Text("Category Entry")
                    .font(.custom("Viga-Regular", size: 25))
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
                
                Spacer()
                
                // MARK: Add Button
                Button(action: {
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
                }, label: {
                    Text("Save")
                        .font(.custom("Ubuntu-Bold", size: 16))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                }) // end add button
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
            }
            .padding(.vertical, 10)
            // end top bar hstack
            
            VStack {
                HStack(){
                    Text("Name:")
                        .foregroundColor(.bright_maroon)
                        .padding(.bottom, 2)
                    Spacer()
                }
                
                TextField("Enter Category Name...", text: $categoryName)
                    .font(.custom("Ubuntu-Regular", size: 16))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(Color.bg_light)
                    .cornerRadius(10)
            }
            .padding()
            
            // MARK: Color Selection
            VStack(alignment: .leading){
                HStack(){
                    Text("Color:")
                        .foregroundColor(.bright_maroon)
                        .padding(.bottom, 2)
                    Spacer()
                }
                
                Picker("Color Options", selection: $currentColor) {
                    Text("Red").tag("red")
                    Text("Orange").tag("orange")
                    Text("Blue").tag("blue")
                    Text("Pink").tag("pink")
                    Text("Yellow").tag("yellow")
                }
                .padding(.horizontal)
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.clear)
            }
            .padding()
            
            Spacer()
        }
        .background(Color.bg_dark)
        //vstack
        
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
