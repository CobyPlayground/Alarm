//
//  NewAlarmView.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/28.
//

import SwiftUI

struct NewAlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var wakeUp = Date.now
    
    init() {
        UITableView.appearance().backgroundColor = .backgroundColor2
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().backgroundColor = .backgroundColor2
        UINavigationBar.appearance().isHidden = false
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Section(
                            header:
                                DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                    .labelsHidden()
                                    .colorScheme(.dark)
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .environment(\.locale, Locale.init(identifier: "en_US"))
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity,
                                        minHeight: 0,
                                        maxHeight: .infinity,
                                        alignment: .top
                                    )) {
                                        
                            NavigationLink(destination: Text("안녕하세요"), label: {
                                    Text("반복")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                            })
                                        
                            NavigationLink(destination: Text("안녕하세요"), label: {
                                    Text("레이블")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                            })
                            
                            NavigationLink(destination: Text("안녕하세요"), label: {
                                    Text("사운드")
                                        .font(.system(size: 17, weight: .regular))
                                        .foregroundColor(.white)
                            })
                        }
                        .listRowBackground(Color.backgroundColor3)
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
                                .foregroundColor(.secondaryColor)
                        })
                    ,trailing:
                        Button(action: {
                        }, label: {
                            Text("저장")
                                .fontWeight(.regular)
                                .foregroundColor(.secondaryColor)
                        })
                )
            }
        }
    }
}

struct NewAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        NewAlarmView()
    }
}
