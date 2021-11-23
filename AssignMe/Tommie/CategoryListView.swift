//
//  CategoryListView.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct CategoryListView: View {
    @State private var isActive = false
    @EnvironmentObject var user: User //Connects CategoryListView to the User object
    @State private var willMoveToNextScreen = false
    var categoryList = [Category]() //from User classSS
    var maxCategories = 8 //variable for func TorF
    func TorF () -> Bool { //Boolean condition to disable 'blue plus' button when maximum amount of categories exist
        if user.categoryList.count == maxCategories {
            return true
        }
        else {
            return false
        }
    } // func TorF END
    
    var body: some View {
        ZStack{
            Color(red: 0.150, green: 0.150, blue: 0.150).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{

                    Text("Categories")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        //.font(.system(size: 25, weight: .bold, design: .serif))
                        //.padding(.horizontal,45)
                        .padding(.leading,120)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    
                            VStack{ //VStack to access CategoriesCreationPage view via 'blue plus' button
                                Button(
                                    action:{ isActive = true
                                            willMoveToNextScreen = true},
                                    label: {
                                        
                                        ZStack{ //ZStack for 'plus' symbol and blue background
                                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                                .frame(width: 75, height: 45)
                                            Image(systemName: "plus")
                                                .resizable()
                                                .foregroundColor(.black)
                                                .frame(width: 20, height: 20)
                                        } //ZStack END
                                        .padding(.trailing, 15)
                                    } //label END
                                ) //Button END
                                .disabled(TorF()) //func ToF() for 'true'/'false' condition to disable button
                            } //VStack to access CategoriesCreationPage view END
  
    
                } //HStack END
                
                ScrollView { //scroll view containing the CategoryCards to be populated into the CategoryListView
                    ForEach(1..<user.categoryList.count, id: \.self) { //starts at index 0 and cycles through categoryList
                        index in
                        HStack{ //HStack for Category Cards
                            CategoryCard(category: user.categoryList[index], catIndex: index)
                        } //HStack for Categories Cards END
                        .padding(.bottom, 15)
                        
                    } //ForEach loop END
                } //ScrollView END
                .frame(width: 350, height: 600)
                
            } //Vstack
            .navigationBarTitle("")
            .navigationBarHidden(true)
        } //ZStack END
        .navigate(to: CategoryCreationFormView(), when: $willMoveToNextScreen)
    } //var body: some View END
} //struct CategoryListView: View END

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
