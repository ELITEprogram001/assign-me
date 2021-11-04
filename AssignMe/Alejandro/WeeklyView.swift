//
//  SwiftUIView.swift
//  AssignMe
//
//  Created by Santos, Alejandro on 11/3/21.
//

import SwiftUI

struct WeeklyView: View {

    
//tbd
    var dateArray = [Date]()
    var stringArray = [String]()
    init() {
        
        let date = Date()
        for n in 0...6
        {
        let modifiedDate = Calendar.current.date(byAdding: .day, value: n, to: date)!
        dateArray.append(modifiedDate)
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = /*"MMM/dd/yyyy"*/  "E, MMM d"
        stringArray.append( formatter.string(from: modifiedDate))
        }
    }
    var body: some View {
        ScrollView {
                VStack {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                //}
            //}
    
        ZStack {
            Color(red:0.150, green:0.150, blue:0.150 )
            .ignoresSafeArea()
            HStack {
                /*ScrollView {
                        VStack {
                            ForEach(0..<100) {
                                Text("Row \($0)")
                            }
                        }
                    }*/
            VStack {
                        ForEach(0..<stringArray.count) { index in
                            Text(stringArray[index])
                                .font(.system(size: 40  ))
                                .foregroundColor(Color.white) /*.padding(.leading, 0.0)*/
                                
                        }
                    }
            .padding(.init(top: 0, leading: 20, bottom: 400, trailing: 20))
        }
            .padding(.leading,-170)
        }
                }
        /*VStack {
                    ForEach(0..<stringArray.count) { index in
                        Text(stringArray[index])
                    }
                }*/

    }
}
}
struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}

