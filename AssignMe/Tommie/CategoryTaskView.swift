//
//  CategoryTaskView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/27/21.
//

import SwiftUI

//struct CategoryTaskView: View {
//    
//    @Binding var selectedCategory: CategoryEntity
//    
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(
//        entity: CategoryEntity.entity(),
//        sortDescriptors: [],
//        predicate: NSPredicate()
//    ) var categories: FetchedResults<CategoryEntity>
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Your Next Week")
//                    .font(.custom("Viga-Regular", size: 25))
//                Spacer()
//            }
//            .padding(.horizontal)
//            
//            ScrollView {
//                LazyVStack() {
//                    ForEach(tasks) { task in
//                        TaskCard(task: task)
//                    }
//                    .padding(.bottom, 10)
//                }
//            }
//            .padding()
//        }
//        .background(Color.bg_dark.ignoresSafeArea())
//        .onAppear() {
//            // If the uncategorized category doesn't exist
//            if(categories.isEmpty) {
//                let uncategorized = CategoryEntity(context: managedObjectContext)
//                uncategorized.name = "Uncategorized"
//                uncategorized.color = "gray"
//                
//                try? managedObjectContext.save()
//            }
//        }
//        // end vstack
//        
//    }//body
//}

