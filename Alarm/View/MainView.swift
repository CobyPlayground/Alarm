//
//  ContentView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/27.
//

import SwiftUI

struct MainView: View {
    @State private var showingSheet = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Schedule.entity(), sortDescriptors: [])
    private var schedules: FetchedResults<Schedule>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(schedules, id: \.self) { schedule in
                        AlarmItem(alarmTime: schedule.alarmTime!, alarmLabel: schedule.alarmLabel!, alarmAgain: schedule.alarmAgain as Bool)
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
            //alarms.remove(at: first)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
