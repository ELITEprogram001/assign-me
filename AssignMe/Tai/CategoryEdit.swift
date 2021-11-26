//
//  CategoryEdit.swift
//  AssignMe
//
//  Created by Tran, Tai Vinh on 11/3/21.
//

import SwiftUI

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}

struct CategoryEdit: View {
    @State private var categoryName: String = ""
    @State private var color: String = ""
    @State private var actualColor: Color
    var category: Category
    var catIndex: Int
    @EnvironmentObject var user: UserOld
    @Environment(\.presentationMode) var presentation
    
    init(category: Category, catIndex: Int){
        self.category = category
        self.catIndex = catIndex
        _categoryName = State(initialValue: category.name)
        _actualColor = State(initialValue: category.color)
        _color = State(initialValue: colorString (color: category.color))
    }
    
    func colorString (color: Color) -> String {
        switch color {
        case Color.gray: return "Gray"
        case Color.red: return "Red"
        case Color.green: return "Green"
        case Color.blue: return "Blue"
        case Color.yellow: return "Yellow"
        case Color.orange: return "Orange"
        case Color.purple: return "Purple"
        case Color.pink: return "Pink"
        default: return "uncolored"
        }
    }
    
    
    var body: some View {
        
        
        //NavigationView{
        ZStack {
            Color(red: 0.150, green: 0.150, blue: 0.150).edgesIgnoringSafeArea(.all)//for gray mode
            VStack(spacing: 15){
                    
                    
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
                        .padding(.leading, 10 )

                    }) 
                    Spacer()
                    Text("Category Edit")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(
                        action:{
                            user.categoryList[catIndex].name = categoryName
                            user.categoryList[catIndex].color = actualColor
                            self.presentation.wrappedValue.dismiss()},
                        label:{Text("Save")
                            .bold()
                            .frame(width:60, height: 40)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    ) //Button END
                    Spacer()
                } //hstack
            
                        
                    
                    
                Text("Name:")
                    .foregroundColor(.blue)
                TextField("   Enter Category Name", text: $categoryName)
                    .frame(height: 55)
                    .background(Color(red: 0.17, green: 0.17, blue: 0.17))
                    .padding(.horizontal, 1)
                    .cornerRadius(15)
              
                Text("Color:")
                    .foregroundColor(.blue)
                   
                Menu("\(color)"){
                    //Text("hello")
                    Button(action:{color = "Yellow";
                            actualColor = .yellow }, label:{
                        Text("Yellow")
                    })
                    Button(action:{color = "Blue";
                            actualColor = .blue }, label:{
                        Text("Blue")
                        
                    })
                    Button(action:{color = "Red";
                            actualColor = .red }, label:{
                        Text("Red")
                        
                    })
                    Button(action:{color = "Green";
                            actualColor = .green}, label:{
                        Text("Green")
                        
                    })
                    Button(action:{color = "Orange";
                            actualColor = .orange }, label:{
                        Text("Orange")
                        
                    })
                    Button(action:{color = "Pink";
                            actualColor = .pink}, label:{
                        Text("Pink")
                        
                    })
                    Button(action:{color = "Purple";
                            actualColor = .purple }, label:{
                        Text("Purple")
                            

                    })
                    .foregroundColor(.purple)
                } //menu
                .foregroundColor(.gray)
                Spacer()
                    
            }
        } //vstack
        .navigationBarTitle("")
        .navigationBarHidden(true)
            //.navigationTitle("Category Edit")
        //} //NavigationView
        
    } //body
} //category edit struc
/*
struct CategoryEdit_Previews: PreviewProvider {
    static var previews: some View {

        CategoryEdit().preferredColorScheme(.dark)

    }
}
*/


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
