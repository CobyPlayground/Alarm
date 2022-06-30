//
//  SoundView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/30.
//

import SwiftUI

struct SoundView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var songs = ["노래하나", "노래둘", "노래삼"]
    @State private var bells = ["벨하나", "벨둘", "벨삼", "벨사", "벨오", "벨육", "벨칠", "벨팔", "벨구", "벨십"]
    
    var body: some View {
        VStack {
            List {
                Section {
                    ZStack {
                        NavigationLink(destination: Text("진동 선택")) {
                            EmptyView()
                        }
                        
                        HStack {
                            Text("진동")
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Text("동기화됨")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.fontColor3.opacity(0.6))
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 7)
                                .foregroundColor(.fontColor3.opacity(0.3))
                        }
                    }
                }
                
                Section("노래") {
                    ForEach(songs, id: \.self) { song in
                        Text(song)
                    }
                    
                    NavigationLink(destination: Text("노래 선택")) {
                        Text("노래 선택")
                            .font(.system(size: 17, weight: .regular))
                    }
                }
                
                Section("벨소리") {
                    ForEach(bells, id: \.self) { bell in
                        Text(bell)
                    }
                }
            }
            
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
