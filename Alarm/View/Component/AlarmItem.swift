//
//  AlarmItem.swift
//  Alarm
//
//  Created by COBY_PRO on 2022/06/28.
//

import SwiftUI

struct AlarmItem: View {
    var alarm: String
    @State private var showActive = true
    @State var isShowingSheet = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showActive, label: {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("오전")
                            .font(.system(size: 34, weight: .light))
                            .foregroundColor(.fontColor2)
                            .baselineOffset(-10)
                        Text(alarm)
                            .font(.system(size: 58, weight: .light))
                            .foregroundColor(.fontColor2)
                    }
                    Text("알람")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.fontColor2)
                }
            })
        }
        .listRowBackground(Color.backgroundColor1)
    }
}

struct AlarmItem_Previews: PreviewProvider {
    static var previews: some View {
        AlarmItem(alarm: "6:30")
    }
}
