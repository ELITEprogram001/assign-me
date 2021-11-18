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
    
    func deleteOP() {
        
    }
    
   /* var task: Task
    var taskList = [Task]()
    func taskNum() -> Int{
        var taskcount=0
        if category.name == task.category.name{
            taskcount = taskcount+1
        }
        return taskcount
    } */
    
    var body: some View {
        ZStack{ //Stacks all text, buttons, and other details; starting from bottom to top
            Rectangle() //Card Body
                .fill(Color.clear) //(red: 0.35, green: 0.35, blue: 0.35)) //can be Color: .Clear
                .frame(width: 325, height: 100)
                .shadow(radius: 6) //optional
            
            
            Text("\(category.name)") //variable category name
                .font(.system(size: 21, weight: .light, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, idealWidth: 150, maxWidth: 150, minHeight: 1, idealHeight: 1, maxHeight: 1, alignment: .leading)
                .lineLimit(1)
                .padding(.leading, -125.0)
                .padding (.bottom, 50)
            
            
            Text("\nTasks: 3") //"\nTasks: (2)" number is a placeholder for now
                .font(.system(size: 21, weight: .light, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.leading)
                .padding(.leading, -139.0)
                .padding(.bottom, -30)
            
            
            HStack{ //attributes for the category colour tab to the left
                Rectangle() //Left-hand category colour tab
                    .foregroundColor(category.color)
                    .padding(.leading, 0.0)
                    .frame(width: 20.0, height: 100)
            } //attributes for the category colour tab END
            .padding(.leading, -165.0) //padding for category colour tab
            
            
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
            
            Button( //Delete button with red 'trashcan' icon
                action:{
                    isActive = true
                },
                label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 45, height: 45)
                }
            ) //Delete button END
            .foregroundColor(.red)
            .padding(.leading, 245)
            
          /*  //NavigationLink(destination: CategoryEdit(), isActive: $isActive){
                HStack{ //attributes for blue edit button
                    NavigationLink(destination: CategoryEdit(), isActive: $isActive){
                    Button(
                        action:{},
                        label: {RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 50, height: 50);
                            
                            //HStack{ //attributes for edit button image 'pencil'
                                Image(systemName: "pencil")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 35, height: 35)
                            //} //attributes for edit button image 'pencil' END
                           // .padding(.leading, -50) //padding for edit button image 'pencil'
                            
                        } //label end
                    ) //button end
                    }
                } //attributes for blue edit button END
                .padding(.leading, 100) //padding for //attributes for blue edit button background'
                
            //} //NavigationLink END */
            
            /*
            HStack{ //attributes for delete button background
                Button(
                    action:{print("pls delete")},
                    label: {Image(systemName: "trash")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 45, height: 45)
                    }
                )
            } //attributes for delete button background END
            .padding(.leading, 245) //padding for delete button background */
            
            
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
