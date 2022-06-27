//
//  ContentView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/27.
//

import SwiftUI

struct MainView: View {    
    var body: some View {
        NavigationView {
            ZStack {
                Color("black").ignoresSafeArea(.all)
                
                VStack {
                    Text("안녕")
                    Text("잘가")
                }
                .navigationTitle("알람")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
