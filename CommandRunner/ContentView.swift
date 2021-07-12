//
//  ContentView.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/09.
//

import SwiftUI

struct ContentView: View {
    @State var sections: [ScriptSection] = [ScriptSection(title: "Standard", scripts: [
        Script(title: "CocoaPods", command: "pod install")
    ])]

    var body: some View {
        List {
            ForEach(sections, id: \.title) { section in
                Section(header: Text(section.title)) {
                    ForEach(section.scripts, id: \.title) { script in
                        RowItem(script: script)
                    }
                }
            }
        }
        .onAppear {
            guard let settingsJSONString = FileUtil().loadSettingsFile(),
                  let data = settingsJSONString.data(using: .utf8) else { return }
            do {
                let list = try JSONDecoder().decode(ScriptList.self, from: data)
                self.sections = list.items
            } catch {
                print("parse error: \(error)")
            }
        }
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
