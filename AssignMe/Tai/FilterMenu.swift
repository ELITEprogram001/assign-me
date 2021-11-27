//
//  FilterMenu.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/25/21.
//

import SwiftUI
struct FilterMenu: View {
//    var colors = ["Red", "Green", "Blue", "Tartan"]     //filter by category so we need to read the category from other view.
//    @State private var selectedColor = "Red"
//
//    var body: some View {
//        ZStack{
//            Color(red: 20/255, green: 20/255, blue: 20/255).edgesIgnoringSafeArea(.all)
//
//            VStack{
//                Text("Category Filter")
//                    .bold()
//                    .font(.custom("Viga-Regular", size: 20))
//                    //.padding(.horizontal,45)
//                    .foregroundColor(.white)
//
//
//                Picker("Please choose a choose", selection: $selectedColor) {
//                    ForEach(colors, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .frame( width: 60,alignment: .center)
//                .background(Color(.red))
//                Text("You Selected: \(selectedColor)")
//                Spacer()
//            } //vstack
//            //.background(Color(.red))
//            .frame(width: 200, height: 750)
//            .background(Color(.green))
//
//        } //ZStack
//    } // body
    
        @State var selected = ""
//        @State var show = false
        
        var body: some View {
           
            ZStack{
                RadioButtons(selected: $selected)
            }
                   
        }// body
    
    
    
    
}



var data = ["Yellow","Blue","Red","Green","Orange","Pink","Purple"]

struct RadioButtons : View {
    
    @Binding var selected : String
//    @Binding var show : Bool
    var body : some View{
        ZStack {
            Color(red: 20/255, green: 20/255, blue: 20/255).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Filter By").font(.title).padding(.top)
                ForEach(data,id: \.self) { i in     //go through "data" then create a Button for each Color in "data" with the name along side
                    Button(action: {
                        //self.selected = i
                    }){
                        HStack{ //hstack contain the name and the circle button
                            Text(i) //name
                                .frame(width: 70, height: 10, alignment: .leading)
                            ZStack{
                                Circle()    //outer circle
                                    .fill(Color.white.opacity(0.4))
                                    .frame(width: 20, height: 20)
                                if self.selected == i{
                                    Circle()
                                        .stroke(Color(.white), lineWidth: 4)
                                        .frame(width: 25, height: 25)
                                }
                            } //zstack
                        }
                    }//button
                } //for each
                
    //            HStack{
    //                Spacer()
    //                Button(action: {
    //                    self.show.toggle()
    //                }) {
    //                    Text("Continue").padding(.vertical).padding(.horizontal,25).foregroundColor(.white)
    //                }
    //                .background(
    //                    self.selected != "" ?
    //                        LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing) :
    //                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.2),Color.black.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
    //                )
    //                .clipShape(Capsule())
    //                .disabled(self.selected != "" ? false : true)
    //            }//HStack
    //            .padding(.top)
            } //vstack
          
            .padding(.trailing, 20)
        }
//        .padding(.bottom,(UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
//        .background(Color.white)
//        .cornerRadius(30)
    }
}


struct FilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenu().preferredColorScheme(.dark)
    }
}
