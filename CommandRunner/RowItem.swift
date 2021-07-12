//
//  RowItem.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/09.
//

import SwiftUI

struct RowItem: View {
    let script: Script
    @State var isRunning = false

    var body: some View {
        HStack {
            Text(script.title)
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(0.5, anchor: .center)
                .isHidden(!isRunning)
        }
        .onTapGesture {
            isRunning = true
            let result = Runner().runShell(args: script.command)
            print("run result: \(result)")
            isRunning = false
        }
    }
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        RowItem(script: Script(title: "Cocoapods", command: "pod install"))
    }
}
