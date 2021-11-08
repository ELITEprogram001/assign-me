//
//  CategoryListView.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct CategoryListView: View {
    
    //var category: Category
    var categoryList = [Category]()
    
    mutating func showCats() {
        let testCat1 = Category(name: "Fitness", color: .red)
        let testCat2 = Category(name: "Mental Health", color:.blue)

        categoryList.append(testCat1)
        categoryList.append(testCat2)
    }
    
    init() {
        showCats()
        
        let testCat1 = Category(name: "Fitness", color: .red)
        let testCat2 = Category(name: "Mental Health", color:.blue)

        categoryList.append(testCat1)
        categoryList.append(testCat2)
    }
    
    
    var body: some View {
        
           ZStack{
               Color(red: 0.150, green: 0.150, blue: 0.150)
                               
               Text("Categories")
                   .font(.system(size: 27, weight: .medium, design: .serif))
                   //.fontWeight(.bold)
                   .foregroundColor(Color.white)
                   .padding(.bottom, 660) //positive values push text to top
                       
                   //Image(systemName: "star.fill")
                               
               VStack{
                   Button(
                       action:{print ("go to Category Creation Page")},
                       label: {RoundedRectangle(cornerRadius: 15, style: .continuous)
                           .frame(width: 75, height: 45)
                       }
                   )
                               
                                   
               } //VStack END
               .padding(.leading, 275)
               .padding(.bottom, 660)
                       
               VStack{
                   Image(systemName: "plus")
                       .resizable()
                       .frame(width: 20, height: 20)
                           
                               
               } //VStack END
               .padding(.leading, 275)
               .padding(.bottom, 660)
                               
            Spacer()
                       
               ScrollView {
                        ForEach(0..<8) {index in
                            HStack{
                                CategoryCard(category: categoryList[0])
                            }
                            .padding(.bottom, 15)
                            
                           }

               } //ScrollView END
               .frame(width: 350, height: 550)
               .padding(.top, 5)
                               
           } //ZStack END
       }
   }

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
