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
    
    func TorF () -> Bool {
        if categoryList.count == 7 {
            return true
        }
        else {
            return false
        }
    } // func TorF END
    
   /* mutating func showCats() {
        let testCat1 = Category(name: "Fitness", color: .red)
        let testCat2 = Category(name: "Mental Health", color:.blue)
        let testCat3 = Category(name: "Physical Health", color: .yellow)
        let testCat4 = Category(name: "Pls send help", color:.green)

        categoryList.append(testCat1)
        categoryList.append(testCat2)
        categoryList.append(testCat3)
        categoryList.append(testCat4)
    } */
    
    init() {
        //showCats()
        
        let testCat1 = Category(name: "Fitness", color: .red)
        let testCat2 = Category(name: "Mental Health", color:.blue)
        let testCat3 = Category(name: "Spiritual Health", color: .yellow)
        let testCat4 = Category(name: "Pls send help", color:.green)
        let testCat5 = Category(name: "School and Work", color: .orange)
        let testCat6 = Category(name: "Family and Relationships", color: .purple)
        let testCat7 = Category(name: "My cult", color: .black)

        categoryList.append(testCat1)
        categoryList.append(testCat2)
        categoryList.append(testCat3)
        categoryList.append(testCat4)
        categoryList.append(testCat5)
        categoryList.append(testCat6)
        categoryList.append(testCat7)
    }
    
    var body: some View {
        
           ZStack{
               Color(red: 0.150, green: 0.150, blue: 0.150)
                               
               Text("Categories")
                   .font(.system(size: 27, weight: .medium, design: .serif))
                   //.fontWeight(.bold)
                   .foregroundColor(Color.white)
                   .padding(.bottom, 660) //positive values push text to top
                       
                VStack{ //VStack to access CategoriesCreationPage view
                    Button(
                        action:{print ("go to Category Creation Page")},
                        label: {RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .frame(width: 75, height: 45)
                     
                            VStack{ //VStack for 'plus' symbol within button label
                                Image(systemName: "plus")
                                 .resizable()
                                 .foregroundColor(.black)
                                 .frame(width: 20, height: 20)
                            } //VStack for 'plus' symbol within button label END
                         .padding(.leading, -55)
                        } //label END
                    ) //Button END
                    .disabled(TorF())
                } //VStack to access CategoriesCreationPage view END
                .padding(.leading, 275)
                .padding(.bottom, 660)
                               
                Spacer()
                       
                ScrollView {
                    ForEach(0..<categoryList.count) {
                        index in
                            HStack{ //HStack for Category Cards
                                CategoryCard(category: categoryList[index])
                            } //HStack for Categories Cards END
                        .padding(.bottom, 15)
                        
                    } //ForEach loop END
               } //ScrollView END
               .frame(width: 350, height: 600)
                               
           } //ZStack END
       } //var body: some View END
   } //struct CategoryListView: View END

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
