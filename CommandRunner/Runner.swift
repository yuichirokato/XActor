//
//  Runner.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/10.
//

import Foundation

struct Runner {
    func runShell(args: String) -> Int32 {
        let task = Process()
//        let launchPath = args.components(separatedBy: " ").first!
        task.launchPath = "/Users/yuichiroutakahashi/Downloads/FloatingPanelSample001_takahashi/"
        task.arguments = args.components(separatedBy: " ")
        task.launch()
        task.waitUntilExit()
        
        return task.terminationStatus
    }
}
