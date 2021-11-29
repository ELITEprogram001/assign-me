//
//  FilterMenu.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/25/21.
//

import SwiftUI
struct FilterMenu: View {

    
        @State public var selected = ""
        @State var show = false
        
        var body: some View {
           
            ZStack{
                RadioButtons(selected: self.$selected, show: self.$show)//.offset(y:self.show ? (UIApplication.shared))
                
            }
                   
        }// body

}



var data = ["None","Yellow","Blue","Red","Green","Orange","Pink","Purple"]

struct RadioButtons : View {
    
    @Binding var selected : String
    @Binding var show : Bool
    var body : some View{
        ZStack {
            //Color(red: 20/255, green: 20/255, blue: 20/255).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Filter By:")
                    .font(.custom("Viga-Regular", size: 25))
                    .font(.title)
                    .padding(.top)
                Text((self.selected) )
                ForEach(data,id: \.self) { i in     //go through "data" then create a Button for each Color in "data" with the name along side
                    Button(action: {
                        self.selected = i
                    }){
                        HStack{ //hstack contain the name and the circle button
                            Text(i) //name
                                .frame(width: 75, height: 20, alignment: .leading)
                                
                            ZStack{
                                Circle()    //outer circle
                                    .fill(self.selected == i ? Color(.white): Color.white.opacity(0.2)) //this change the .opacity() which give the illusion that color is filled
                                    .frame(width: 18, height: 18)
                                if self.selected == i { //if seletecd the make some chnge to circle
                                    Circle()
                                        .stroke(Color(.white), lineWidth: 3)
                                        .frame(width: 25, height: 25)
                                }
                            } //zstack
                        } //hstack
                    }//button
                    .foregroundColor(.white)
                } //for each
                Spacer()
                
//                HStack{
//                    Button(action: {
//                        self.show.toggle()
//                    }) {
//                        Text("Apply")
//                            .padding(.vertical)
//                            .padding(.horizontal,25)
//                            .foregroundColor(.white)
//
//
//                    }
//                    .background(
//                        self.selected != "" ?   //this to set the default color state of button to black, change when condition is met
//                        LinearGradient(gradient: .init(colors: [Color(.yellow),Color(.red)]), startPoint:.topLeading, endPoint: .bottomTrailing) :
//                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.5),Color.black.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
//
//                    )
//                    .clipShape(Capsule())
//                    .disabled(self.selected != "" ? false : true)   //disable button when not selected a radio
//                }//HStack
                Spacer()
                
            } //vstack
            .frame(height: 430)
            .padding()
            .background(Color(red: 25/255, green: 25/255, blue: 25/255))
            .cornerRadius(30)
        }
    }
}


struct FilterMenu_Previews: PreviewProvider {
    static var previews: some View {
        FilterMenu().preferredColorScheme(.dark)
    }
}
