//
//  CategoryCard.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 10/17/21.
//

import SwiftUI
import Foundation

//comment

//var Testing = Category(name: "Fitness", color: .red) //comment out when no longer needed for designing category card
//var Cat_Task_Count = Int count of items in list of tasks assigned to specific category
//var Cat_Task_Count = 13 //placeholder test for Cat_Task_CounttTT




//Personal Notes:
//Note 1:
//        Text("\(category.name)") // Replace 'category name' with this

//Note 2:
/*Button(
 action:{NavigationLink (destination: CategoryEdit())},
 label: {Image("edit")}
 )*/

struct CategoryCard: View {
    
    @State private var isActive = false
    var category: Category  //KEEP THIS; uncomment when ready for use
    var categoryList = [Category]()
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
    @State var showAlert = false
    @State private var showingAlert = false
    var catIndex: Int

    func del () {
        for index in 1..<user.taskList.count {
            if (user.taskList[index].category.id == user.categoryList[catIndex].id){
                user.taskList[index].category = user.categoryList[0]
            }
        }
        
        user.categoryList.remove(at: catIndex)
    }
    
    func indexCheck () ->Category {
        if catIndex >= user.categoryList.count {
            return user.categoryList[0]
        }
        return user.categoryList[catIndex]
    }
    
    func intCheck () -> Int {
        if catIndex >= user.categoryList.count{
            return 0
        }
        return catIndex
    }
    
    func taskNum() -> Int {
        var count = 0
        for index in 1..<user.taskList.count {
            if (user.taskList[index].category.name == user.categoryList[intCheck()].name){
                count = count + 1
            }
        }
        return count
    } //taskNum END
    
    var body: some View {
        ZStack{ //Stacks all text, buttons, and other details; starting from bottom to top
            Rectangle() //Card Body
                .fill(Color.clear) //(red: 0.35, green: 0.35, blue: 0.35)) //can be Color: .Clear
                .frame(width: 325, height: 100)
                .shadow(radius: 6) //optional
            
            
            
            /*      Text("\(category.name)") //variable category name
             .font(.system(size: 30, weight: .light, design: .serif))
             
             Text("\(category.name)") //variable category name
             .font(.custom("Montserrat-Regular", size: 30))
             //.font(.system(size: 30, weight: .light, design: ))
             
             .fontWeight(.bold)
             .foregroundColor(Color.white)
             .multilineTextAlignment(.leading)
             .lineLimit(2)
             //.frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 0, idealHeight: 3, maxHeight: 5, alignment: .leading)
             .frame(width: 150, height: 50, alignment: .leading)
             .minimumScaleFactor(0.39)
             .padding(.leading, -125.0)
             .padding (.bottom, 2)  */
            
            
            Text("\(category.name)") //variable category name
                .font(.custom("Ubuntu-Regular", size: 21))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                // .frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .leading)
                .frame (width: 150, height: 50, alignment: .leading)
                .minimumScaleFactor(0.39)
                .padding(.leading, -125.0)
                .padding (.bottom, 21)
            
            
            
            
            Text("\nTasks: \(taskNum())") //"\nTasks: (2)" number is a placeholder for now
                .font(.custom("Ubuntu-Regular", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.leading, -139.0)
                .padding(.top, 50.0)
            
            
//-------------------------------KEEP ME FOR NOW 4:03 AM 23 November 2021 ---------------------
            
    /*        Text("\(category.name)") //variable category name
                .font(.system(size: 21, weight: .light, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .leading)
                .lineLimit(1)
                .padding(.leading, -125.0)
                .padding (.bottom, 50) */
            
            
     /*       Text("\nTasks: 3") //"\nTasks: (2)" number is a placeholder for now
                .font(.system(size: 21, weight: .light, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.leading, -139.0)
                .padding(.bottom, -30) */
//----------------------------------- END-------------------------------------------------
            
            
            HStack{ //attributes for the category colour tab to the left
                Rectangle() //Left-hand category colour tab
                    .foregroundColor(category.color)
                    .padding(.leading, 0.0)
                    .frame(width: 20.0, height: 100)
            } //attributes for the category colour tab END
            .padding(.leading, -165.0) //padding for category colour tab
            
            
            NavigationLink(destination: CategoryEdit(category: indexCheck(), catIndex: intCheck()), isActive: $isActive){
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
            
            
            
            Button( //Delete button with red 'trashcan' icon
                action:{
                    self.showAlert = true
                },
                label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 45, height: 45)
                }
            ) //Delete button END
            .foregroundColor(.red)
            .padding(.leading, 245)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure you want to delete this category?"),
                    message: Text("This action cannot be undone"),
                    primaryButton: .destructive(Text("Delete"), action: {del()} ),
                    secondaryButton: .cancel()
                ) //Alert END
            } //.alert END
            
//-------------------- Delete Buttons END---------------------------------
            
            
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
/*
 struct CategoryCard_Previews: PreviewProvider {
 static var previews: some View {
 CategoryCard()
 }
 }
 */
