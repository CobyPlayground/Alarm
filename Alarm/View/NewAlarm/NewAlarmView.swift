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
        UITableView.appearance().backgroundColor = .darkGray
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = false
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkGray.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden() 
                        .colorScheme(.dark)
                        .datePickerStyle(WheelDatePickerStyle())
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity,
                            alignment: .top
                        )
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
                                .foregroundColor(.orange)
                        })
                    ,trailing:
                        Button(action: {
                        }, label: {
                            Text("저장")
                                .fontWeight(.regular)
                                .foregroundColor(.orange)
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
