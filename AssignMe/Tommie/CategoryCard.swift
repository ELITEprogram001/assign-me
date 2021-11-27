//
//  CategoryCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 10/17/21.
//

import SwiftUI
import Foundation

struct CategoryCard: View {
    
    // MARK: Variables
    @State var showAlert = false
    let category: CategoryEntity
    
    @EnvironmentObject var user: UserOld
    @Environment(\.presentationMode) var presentation
    
    @State var showSheet: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    init(category: CategoryEntity) {
        self.category = category
    }
    
    // MARK: Category Card Body
    var body: some View {
        
        HStack(){
            
            // Color Strip
            Rectangle()
                .fill(Color(category.wrappedColor))
                .frame(width: 10)
            
            // Text Info
            Text(category.wrappedName)
                .font(.custom("Ubuntu-Bold", size: 18))
            
            Spacer()
            
            // MARK: Edit Button
            Button(
                action:{
                    showSheet = true
                },
                label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            ) // end button
            .sheet(isPresented: $showSheet, content: {
                CategoryEdit(category: category, showSheet: $showSheet)
            })
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
            
            // MARK: Delete Button
            Button(
                action:{
                    showAlert = true
                },
                label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            ).alert(isPresented: $showAlert) {
                Alert(title: Text("Are you sure?"), message: Text("Deleting a category is permanent."), primaryButton: .destructive(Text("Delete"), action: {
                    
                    managedObjectContext.delete(category)
                    try? managedObjectContext.save()
                    
                }), secondaryButton: .default(Text("Cancel")))
            }
            
            
            .frame(width: 40, height: 40)
            .padding(.horizontal, 5)
            .foregroundColor(.red)
            // end delete button
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color.bg_light)
    } // end body
} // end struct
        
