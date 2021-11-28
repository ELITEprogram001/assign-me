//
//  CategoryListView.swift
//  AssignMe
//
//  Created by Arceneaux, Tommie on 11/3/21.
//

import SwiftUI

struct CategoryListView: View {
//    @State private var isActive = false
//    @State private var willMoveToNextScreen = false
//    var categoryList = [Category]() //from User classSS
    var maxCategories = 8
    @State var showCategoryCreate: Bool = false
    
    
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
                
                // MARK: Add Button
                VStack{
                    Button(
                        action:{
//                            isActive = true
//                            willMoveToNextScreen = true
                            showCategoryCreate = true
                        },
                        label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.bright_maroon)
                                    .frame(width: 30, height: 30)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.horizontal, 10)
                            // end ZStack
                            
                        } // end label
                    ) // end button
                    .disabled(userAtMaxCategories())
                    .sheet(isPresented: $showCategoryCreate) {
                        CategoryCreationFormView(showCategoryCreate: $showCategoryCreate)
                            .environment(\.managedObjectContext, managedObjectContext)
                    }
                }
                .padding(.horizontal, 20)
                // end vstack
            }
            .padding(.top, 10)
            .padding(.bottom, 30)
            
            // MARK: Category Card List
            ScrollView {

                ForEach(categories) { category in
                    if(category.wrappedName == "Uncategorized") {
                        CategoryCard(category: category, editable: false, deletable: false)
                    } else {
                        CategoryCard(category: category)
                    }
                }
            } //ScrollView END
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal)
            
        } //Vstack
        .background(Color.bg_dark.ignoresSafeArea())
        .navigationBarTitle("")
        .navigationBarHidden(true)
//        .navigate(to: CategoryCreationFormView(), when: $willMoveToNextScreen)
    } //var body: some View END
    
    // MARK: Custom Functions
    
    //Boolean condition to disable 'blue plus' button when maximum amount of categories exist
    func userAtMaxCategories () -> Bool {
        if categories.count >= maxCategories {
            return true
        }
        return false
    }
    
} //struct CategoryListView: View END

