//
//  CategoryEdit.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/3/21.
//

import SwiftUI

struct CategoryEdit: View {
    @State private var categoryName: String = ""
    var category: CategoryEntity
    @State var currentColor: String = "red"
    
    @Binding var showSheet: Bool
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentation
    
    init(category: CategoryEntity, showSheet: Binding<Bool>){
        self.category = category
        _categoryName = State(initialValue: category.wrappedName)
        _showSheet = showSheet
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Divider()
                .frame(height: 3)
                .frame(maxWidth: .infinity)
                .background(Color.bright_maroon)
            
            HStack(){
                Spacer()
                
                // MARK: Back Button
                Button(action: {
                    showSheet = false
                }, label: {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.bright_maroon)
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
                
                // MARK: Update Button
                Button(action: {
                    category.name = categoryName
                    category.color = currentColor
                    
                    try? managedObjectContext.save()
                    showSheet = false
                }, label: {
                    Text("Update")
                        .font(.custom("Ubuntu-Bold", size: 16))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                }) // end add button
                .background(Color.bright_maroon)
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
                .foregroundColor(.bg_light)
            }
            .padding()
            
            Spacer()
        }
        .background(Color.bg_dark.ignoresSafeArea())
        // end vstack
        
    } //body
} //category edit struc


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
