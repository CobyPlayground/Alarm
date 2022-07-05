//
//  NewAlarmView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/28.
//

import SwiftUI

struct NewAlarmView: View {
    @State private var wakeUp = Date.now
    @State private var showActive = true
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Schedule.entity(), sortDescriptors: [])
    private var schedules: FetchedResults<Schedule>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(
                        header:
                            DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .environment(\.locale, Locale.init(identifier: "en_US"))
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .top
                            )) {
                                
                                ZStack {
                                    NavigationLink(destination: RepeatIView()) {
                                        EmptyView()
                                    }
                                    
                                    HStack {
                                        Text("반복")
                                            .font(.system(size: 17, weight: .regular))
                                        Spacer()
                                        Text("안 함")
                                            .font(.system(size: 17, weight: .regular))
                                            .foregroundColor(.fontColor3.opacity(0.6))
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 7)
                                            .foregroundColor(.fontColor3.opacity(0.3))
                                    }
                                }
                                
                                ZStack {
                                    NavigationLink(destination: LabelView()) {
                                        EmptyView()
                                    }
                                    
                                    HStack {
                                        Text("레이블")
                                            .font(.system(size: 17, weight: .regular))
                                        Spacer()
                                        Text("알람")
                                            .font(.system(size: 17, weight: .regular))
                                            .foregroundColor(.fontColor3.opacity(0.6))
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 7)
                                            .foregroundColor(.fontColor3.opacity(0.3))
                                    }
                                }
                                
                                ZStack {
                                    NavigationLink(destination: SoundView()) {
                                        EmptyView()
                                    }
                                    
                                    HStack {
                                        Text("사운드")
                                            .font(.system(size: 17, weight: .regular))
                                        Spacer()
                                        Text("절정")
                                            .font(.system(size: 17, weight: .regular))
                                            .foregroundColor(.fontColor3.opacity(0.6))
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 7)
                                            .foregroundColor(.fontColor3.opacity(0.3))
                                    }
                                }
                                
                                Toggle(isOn: $showActive, label: {
                                    Text("다시 알림")
                                        .font(.system(size: 17, weight: .regular))
                                })
                            }
                }
            }
            .navigationTitle("알람 추가")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("취소")
                            .fontWeight(.regular)
                            .foregroundColor(.fontColor1)
                    })
                ,trailing:
                    Button(action: {
                        saveAlarm()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("저장")
                            .fontWeight(.regular)
                            .foregroundColor(.fontColor1)
                    })
            )
        }
    }
    
    private func saveAlarm() {
        do {
            let schedule = Schedule(context: viewContext)
            
            schedule.alarmTime = wakeUp
            schedule.alarmDay = 0
            schedule.alarmLabel = "알람"
            schedule.alarmSound = "노래"
            schedule.alarmAgain = showActive
            
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct NewAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        NewAlarmView()
    }
}
