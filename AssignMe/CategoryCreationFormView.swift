//
//  CategoryCreationFormView.swift
//  AssignMe
//
//  Created by Rohan Jose on 10/17/21.
//

import SwiftUI
struct FilledButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    var isActive: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(isActive ? Color.blue : Color(red: 0.15, green: 0.15, blue: 0.15))
            .cornerRadius(8)
    }
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
struct CategoryCreationFormView: View {
    @State var categoryName: String = ""
    @State var currentColor: String = "Select Category Color..."
    @State var isActive: Bool = false
    func ActiveLogic() -> Bool{
        if(categoryName=="Enter Category Name...")
        {
            return false
        }
        else{
            return true
        }
    }
    var body: some View {
        ZStack(){
            Color(red: 0.133, green: 0.133, blue: 0.133).edgesIgnoringSafeArea(.all)
            VStack() {
                HStack(){
                Spacer()
                Button("Back"){
                        
                    }
                    .buttonStyle(FilledButton(isActive: false))
                    .padding(.leading,15)
                Spacer()
                    Text("Category Entry")
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                Spacer()
                Button("Add"){
                        
                    }
                    .buttonStyle(FilledButton(isActive: isActive))
                    .padding(.trailing,15)
                Spacer()
                }
                TextField("", text: $categoryName
                          , onCommit: {
                                      isActive=true
                                  }
                    )
                    .placeholder(when: categoryName.isEmpty) {
                            Text("Enter Category Name...").foregroundColor(.white)
                    }
                    
                    .background(Color(red: 0.133, green: 0.133, blue: 0.133))
                    .padding(.horizontal, 30)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .foregroundColor(Color.white)
                Rectangle()
                    .fill(Color.black)
                    .frame(width:340, height:1)
                    .padding(.horizontal, 30)
                Menu("\(currentColor)"){
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


                }
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                Rectangle()
                    .fill(Color.black)
                    .frame(width:340, height:1)
                    .padding(.horizontal, 30)

                Spacer()
            }
    
        }
       .navigationBarHidden(true)

    }
}

struct CategoryCreationFormView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCreationFormView()
    }
}
