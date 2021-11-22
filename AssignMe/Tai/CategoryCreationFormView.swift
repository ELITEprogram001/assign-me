//
//  CategoryCreationFormView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/17/21.
//

import SwiftUI
//struct FilledButton: ButtonStyle {
//    @Environment(\.isEnabled) private var isEnabled
//    var isActive: Bool
//    func makeBody(configuration: Configuration) -> some View {
//        configuration
//            .label
//            .foregroundColor(configuration.isPressed ? .gray : .white)
//            .background(isActive ? Color.blue : Color(red: 0.15, green: 0.15, blue: 0.15))
//            .cornerRadius(8)
//    }
//}
//extension View {
//    func placeholder<Content: View>(
//        when shouldShow: Bool,
//        alignment: Alignment = .leading,
//        @ViewBuilder placeholder: () -> Content) -> some View {
//
//        ZStack(alignment: alignment) {
//            placeholder().opacity(shouldShow ? 1 : 0)
//            self
//        }
//    }
//} //view extension

struct CategoryCreationFormView: View {
    @State var categoryName: String = ""
    @State var currentColor: String = "Select Category Color..."
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentation
//    @State var isActive: Bool = false
//    func ActiveLogic() -> Bool{
//        if(categoryName=="Enter Category Name...")
//        {
//            return false
//        }
//        else{
//            return true
//        }
//    }
    
    var body: some View {
        
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack(spacing: 15) {
                HStack(){
                    Spacer()
                    Button(action:{
                    
                     
                        self.presentation.wrappedValue.dismiss()
                    },label:{
                        
                        Image(systemName: "arrow.backward.circle")
                        .frame(width: 60, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading, 8 )

                    })  //button
                    
//                    Button("Back"){
//                        self.presentation.wrappedValue.dismiss()
//                    }
//                    //.buttonStyle(FilledButton(isActive: false))
//                    .frame(width: 60, height: 40)
//                    .padding(.leading,5)
//                    .background(Color(.blue))
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
                    
                    Spacer()
                    Text("Category Entry")
                        .bold()
                        .font(.custom("Viga-Regular", size: 25))
                        //.padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(.horizontal,10)
                    
                 /*   BlueButton(title:"Add")
                        .padding(.horizontal,10)  */
                    Spacer()
                    Button("Add"){
                        let toAdd = Category(
                            name:categoryName,
                            color: .red)
                        user.categoryList.append(toAdd)
                        self.presentation.wrappedValue.dismiss()
                    } //button
                    .frame(width: 60, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal,2)
                    
                    Spacer()
//                    Button("Add"){
//
//                    }
//                    .buttonStyle(FilledButton(isActive: isActive))
//                    .padding(.trailing,15)
                    
                } //hstack
                
                Text("Name:")
                    .foregroundColor(.blue)
                TextField("    Enter Category Name...", text: $categoryName)
                    .padding(.horizontal, 1)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
                
                Text("Color:")
                    .foregroundColor(.blue)
                   
                Menu("\(currentColor)"){
                    //Text("hello")
                    Button(action:{currentColor="Yellow" }, label:{
                        Text("Yellow")
                    })
                    Button(action:{currentColor="Blue" }, label:{
                        Text("Blue")
                        
                    })
                    Button(action:{currentColor="Red" }, label:{
                        Text("Red")
                        
                    })
                    Button(action:{currentColor="Green" }, label:{
                        Text("Green")
                        
                    })
                    Button(action:{currentColor="Orange" }, label:{
                        Text("Orange")
                        
                    })
                    Button(action:{currentColor="Indigo" }, label:{
                        Text("Indigo")
                        
                    })
                    Button(action:{currentColor="Violet" }, label:{
                        Text("Violet")
                            

                    })
                    .foregroundColor(.purple)
                } //menu
                .foregroundColor(.gray)
                Spacer()
            } //vstack
            
        }
        .navigationBarHidden(true)
        
    }
}
struct CategoryCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCreationFormView().preferredColorScheme(.dark)
       
    }
}

private struct BlueButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .frame(width:60, height: 40)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
