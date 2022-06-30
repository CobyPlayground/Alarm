//
//  ContentView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/27.
//

import SwiftUI

struct MainView: View {
    @State private var alarms = ["7:30", "7:42", "6:33"]
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(alarms, id: \.self) { alarm in
                        AlarmItem(alarm: alarm)
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.grouped)
            }
            .navigationTitle("알람")
            .navigationBarItems(
                leading:
                    Button(action: {
                        print("편집")
                    }, label: {
                        Text("편집")
                            .fontWeight(.regular)
                            .foregroundColor(.fontColor1)
                    })
                ,trailing:
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.fontColor1)
                    })
                    .sheet(isPresented: $showingSheet) {
                        NewAlarmView()
                    }
            )
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            alarms.remove(at: first)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
