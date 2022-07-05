//
//  AlarmItem.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/28.
//

import SwiftUI

struct AlarmItem: View {
    var alarmTime: Date
    var alarmLabel: String
    @State var alarmAgain = true
    @State var isShowingSheet = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $alarmAgain, label: {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(alarmTime.getFormattedDate(format: "a"))
                            .font(.system(size: 34, weight: .light))
                            .foregroundColor(.fontColor2)
                            .baselineOffset(-10)
                        Text(alarmTime.getFormattedDate(format: "h:mm"))
                            .font(.system(size: 58, weight: .light))
                            .foregroundColor(.fontColor2)
                    }
                    Text(alarmLabel)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.fontColor2)
                }
            })
        }
        .listRowBackground(Color.backgroundColor1)
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
