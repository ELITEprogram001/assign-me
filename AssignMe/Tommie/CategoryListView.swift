//
//  CategoryListView.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is true.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            } //ZStack END
        } //NavigationView END
    } //some View END
} //extension View END

struct CategoryListView: View {
    
    //@State private var isActive = false
    @EnvironmentObject var user: User //Connects CategoryListView to the User object
    
    @State private var willMoveToNextScreen = false
    
    var categoryList = [Category]() //from User classSS
    
    var maxCategories = 7 //variable for func TorF
    func TorF () -> Bool { //Boolean condition to disable 'blue plus' button when maximum amount of categories exist
        if categoryList.count == maxCategories {
            return true
        }
        else {
            return false
        }
    } // func TorF END
    
    
    //------------------------------- Testing Stuff START-------------------------
     init() {
     
     let testCat1 = Category(name: "Uncategorized", color: .gray)
     let testCat2 = Category(name: "Mental Health", color:.blue)
     let testCat3 = Category(name: "Spiritual Health", color: .yellow)
     let testCat4 = Category(name: "Pls send help", color:.green)
     let testCat5 = Category(name: "School and Work", color: .orange)
     let testCat6 = Category(name: "Family and Relationships", color: .purple)
     //let testCat7 = Category(name: "My cult", color: .black)
     
        categoryList.append(testCat1)
        categoryList.append(testCat2)
        categoryList.append(testCat3)
        categoryList.append(testCat4)
        categoryList.append(testCat5)
        categoryList.append(testCat6)
     //categoryList.append(testCat7)
     }
    //------------------------------- Testing Stuff END-------------------------
    
    var body: some View {
        
        ZStack{
            Color(red: 0.150, green: 0.150, blue: 0.150)
            
            Text("Categories") //"Categories" title on top of CategoryListView
                .font(.system(size: 27, weight: .medium, design: .serif))
                //.fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.bottom, 660) //positive values push text to top
            
            
            Button( //Blue 'plus' button to navigate to CategoriesCreationPage
                action:{
                    //isActive = true
                    willMoveToNextScreen = true
                },
                label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            ) //Blue edit button END
            .frame(width: 75, height: 45)
            .background(Color.blue)
            .foregroundColor(.black)
            .cornerRadius(15.0)
            .padding(.leading, 275)
            .padding(.bottom, 640)
                
            
      /*      VStack{ //VStack to access CategoriesCreationPage view via 'blue plus' button
               Button(
                    action:{ print ("go to Category Creation Page")},
                    label: { RoundedRectangle(cornerRadius: 15, style: .continuous)
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
                .disabled(TorF()) //func ToF() for 'true'/'false' condition to disable button
            } //VStack to access CategoriesCreationPage view END
            .padding(.leading, 275)
            .padding(.bottom, 660) */
            
            Spacer()
            
            VStack{
            ScrollView { //scroll view containing the CategoryCards to be populated into the CategoryListView
                ForEach(0..<categoryList.count) { //starts at index 0 and cycles through categoryList
                    index in
                    HStack{ //HStack for Category Cards
                        CategoryCard(category: categoryList[index])
                    } //HStack for Categories Cards END
                    .padding(.bottom, 15)
                    
                } //ForEach loop END
            } //ScrollView END
            .frame(width: 350, height: 600)
            } //VStack
            
        } //ZStack END
        .navigate(to: CategoryCreationFormView(), when: $willMoveToNextScreen)
    } //var body: some View END
} //struct CategoryListView: View END

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
