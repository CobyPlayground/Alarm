//
//  RepeatIView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/30.
//

import SwiftUI

struct RepeatIView: View {
    //@Binding var alarmDay: Int
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private var days = ["일", "월", "화", "수", "목", "금", "토"]
    
    var body: some View {
        VStack {
            List {
                ForEach(days.indices) { index in
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Text("\(days[index])요일마다")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                    })
                }
            }
        }
        .navigationTitle("반복")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.fontColor1)
                Text("뒤로")
                    .fontWeight(.regular)
                    .foregroundColor(.fontColor1)
            }
        })
    }
}
