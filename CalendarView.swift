//
//  CalendarView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct CalendarView: View {
    
    let data = (1...31).map { "\($0)" }
    @State var date = Date()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
       
        HStack {
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("<-")
            }
            .foregroundColor(.red)
            Spacer()
            Text("October").font(.title)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("->")
            }
            .foregroundColor(.red)
            Spacer()
        }//HStack
        
        .padding(.top, 20.0)
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                }
//                .padding(.bottom, 20.0)
//            }
//            .padding(.horizontal)
//        }//scrolling
//
//        .frame(maxHeight: 420)
//        ZStack {
//            Color.black.ignoresSafeArea()
//            VStack(spacing: 20){
//                HStack {
//                    Text(date.description)
//                        .bold()
//                        .font(.title2)
//                        .foregroundColor(.red)
//                        .padding(.leading)
//                    Spacer()
//                }
//                ScrollView {
//                    LazyVStack(spacing: 20){
//
//                    }
//                }
//            }
//
//        }//zstack
        
    
     
        
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
