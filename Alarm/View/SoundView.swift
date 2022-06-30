//
//  SoundView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/30.
//

import SwiftUI

struct SoundView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle("사운드")
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

struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}
