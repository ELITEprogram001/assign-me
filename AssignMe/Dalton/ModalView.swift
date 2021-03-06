//
//  ModalView.swift
//  AssignMe
//
//  Created by Ridgeway, Dalton D on 11/24/21.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var showModal: Bool
    @Binding var achievement: Achievement
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if(showModal) {
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showModal = false
                    }
                
                achievementDetails
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut)
        // end ZStack
    } // end body
    
    var achievementDetails: some View {
        VStack(){
            Divider()
                .frame(height: 3)
                .background(Color.fg_main)
                .padding(.bottom, 20)
            VStack(spacing: 0){
                Text(achievement.name)
                    .font(.custom("Viga-Regular", size: 30, relativeTo: .title))
                Image(achievement.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(25)
                HStack {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.gray)
                                .frame(width: geometry.size.width, height: 10)
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.fg_main)
                                .frame(width: (geometry.size.width * achievement.progress), height: 10)
                                
                        }
                    }
                }
                .frame(height: 12)
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
//                HStack{
//                    Text("Lvl. 0")
//                        .font(.custom("Ubuntu-Bold", size: 16, relativeTo: .body))
//                    Text("Next level in 5 more tasks.")
//                        .font(.custom("Ubuntu-Light", size: 16, relativeTo: .body))
//                }
//                .padding(4)
                Text(achievement.desc)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal, 10)
            }
            .font(.custom("Ubuntu", size: 16, relativeTo: .body))
            Spacer()
        }
        .font(.custom("Viga-Regular", size: 20, relativeTo: .title))
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height/2)
        .background(Color.bg_dark.ignoresSafeArea())
    }
}



//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView()
//    }
//}
