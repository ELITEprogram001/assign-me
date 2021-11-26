//
//  CategoryListView.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct CategoryListView: View {
    @State private var isActive = false
    @EnvironmentObject var user: UserOld //Connects CategoryListView to the User object
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
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: CategoryEntity.entity(),
      sortDescriptors: []
    ) var categories: FetchedResults<CategoryEntity>
    
    var body: some View {
        VStack{
            ZStack(alignment: .trailing){
                HStack {
                    Spacer()
                    Text("Categories")
                        .font(.custom("Viga-Regular", size: 25))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                //VStack to access CategoriesCreationPage view via 'blue plus' button
                VStack{
                    Button(
                        action:{ isActive = true
                                willMoveToNextScreen = true},
                        label: {
                            //ZStack for 'plus' symbol and blue background
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 20, height: 20)
                            } // end ZStack
                            .padding(.horizontal, 10)
                        } // end label
                    ) // end button
                    .disabled(TorF()) //func ToF() for 'true'/'false' condition to disable button
                } // end vstack
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 30)
            
            // MARK: Category Card List
            ScrollView { //scroll view containing the CategoryCards to be populated into the CategoryListView

                ForEach(categories) { category in
                    CategoryCard(category: category)
                }
            } //ScrollView END
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
            
        } //Vstack
        .background(Color.bg_dark.ignoresSafeArea())
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigate(to: CategoryCreationFormView(), when: $willMoveToNextScreen)
    } //var body: some View END
} //struct CategoryListView: View END

