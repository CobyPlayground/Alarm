//
//  ContentView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/27.
//

import SwiftUI

struct MainView: View {
    @State var alarms = ["7:30", "7:42", "6:33"]
    
    init() {
        UITableView.appearance().backgroundColor = .black
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        NavigationView {
            ZStack {
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
                                .foregroundColor(.orange)
                        })
                    , trailing:
                        Button(action: {
                            print("편집")
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(.orange)
                        })
                )
            }
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
