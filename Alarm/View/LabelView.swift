//
//  LabelView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/30.
//

import SwiftUI

struct LabelView: View {
    @Binding var alarmLabel: String
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
                TextField("", text: $alarmLabel).modifier(ClearButton(text: $alarmLabel))
            }
        }
        .navigationTitle("레이블")
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

public struct ClearButton: ViewModifier {
    @Binding var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" } // onTapGesture or plainStyle button
        }
    }
}
