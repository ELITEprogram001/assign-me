//
//  CategoryCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 10/17/21.
//

import SwiftUI
import Foundation

struct CategoryCard: View {
    
    @State private var isActive = false
    let category: CategoryEntity
    
    @EnvironmentObject var user: UserOld
    @Environment(\.presentationMode) var presentation
    @State var showAlert = false
    @State private var showingAlert = false
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
            
            // Pencil Icon
            Button(
                action:{
//                        isActive = true
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
//            NavigationLink(destination: CategoryEdit(category: category)) {
//
//            } // end NavigationLink
            
            // Delete Button
            Button(
                action:{
                    self.managedObjectContext.delete(category)
                    try? managedObjectContext.save()
//                    showAlert = true
//                    isActive = true
//                    del()
                },
                label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            )
            .frame(width: 40, height: 40)
            .padding(.horizontal, 5)
            .foregroundColor(.red)
            // end delete button
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(Color.bg_light)
    } // end body
} // end struct
        /*
        ZStack{
            
            //Card Body
            Rectangle()
                .fill(Color.clear) //(red: 0.35, green: 0.35, blue: 0.35)) //can be Color: .Clear
                .frame(width: 325, height: 100)
                .shadow(radius: 6) //optional
            
            
            Text("\(category.wrappedName)") //variable category name
                .font(.system(size: 30, weight: .light, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(width: 150, height: 50, alignment: .leading)
                .minimumScaleFactor(0.39)
                .padding(.leading, -125.0)
                .padding (.bottom, 2)
            
            
            HStack{ //attributes for the category colour tab to the left
                Rectangle() //Left-hand category colour tab
                    .foregroundColor(Color(category.wrappedColor))
                    .padding(.leading, 0.0)
                    .frame(width: 20.0, height: 100)
            } //attributes for the category colour tab END
            .padding(.leading, -165.0) //padding for category colour tab
            
            
            NavigationLink(destination: CategoryEdit(category: category)) {
                Button( //Blue edit button with black 'pencil' icon
                    action:{
                        isActive = true
                    },
                    label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                ) //Blue edit button END
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .foregroundColor(.black)
                .cornerRadius(15.0)
                .padding(.leading, 100)
            } //NavigationLink END
            
            //Delete button with red 'trashcan' icon
            Button(
                action:{
                    self.managedObjectContext.delete(category)
                    try? managedObjectContext.save()
//                    showAlert = true
//                    isActive = true
//                    del()
                },
                label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 45, height: 45)
                }
            )
            .foregroundColor(.red)
            .padding(.leading, 245)
            //Delete button END
*/
//-------------------- Delete Buttons ---------------------------------
            //Partially functional delete alert popup
            
      /*     Button("Hello") { //Alert popup menu for deletion confirmation
                showingAlert = true
            }
            
            .alert("Important message", isPresented:\($showingAlert)) {
                        Button("OK", role: .cancel) { }
                    }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure you want to delete this?"),
                    message: Text("Decision is final"),
                    primaryButton: .destructive(Text("Delete")) {
                        print("Delete")
                       // del()
                    },
                    secondaryButton: .cancel()
                )
            } */
            
            
            
            
//-------------------- Delete Buttons END---------------------------------
/*
            
            VStack{ //black bottom line
                Rectangle()
                    .fill(Color.black)
                    .padding(.bottom, 0.0)
                    .frame(width: 270.0, height: 1)
            } //black bottom line END
            .padding(.top, 99.0) //padding for black bottom line
            
        } //ZStack END
        
    } //var body: some View END
    
} //struct CategoryCard: View END
 */
