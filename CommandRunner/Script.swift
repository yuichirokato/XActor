//
//  Script.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/09.
//

import Foundation

struct Script: Decodable {
    let title: String
    let command: String
}

struct ScriptSection: Decodable {
    let title: String
    let scripts: [Script]
}

struct ScriptList: Decodable {
    let items: [ScriptSection]
}

struct FileUtil {
    let fileManager: FileManager
    
    private var applicationHomeURL: URL {
        var homeURL = fileManager.homeDirectoryForCurrentUser
        homeURL.appendPathComponent("XActor")
        return homeURL
    }
    private var settingsFileURL: URL {
        var applicationHomeURL = self.applicationHomeURL
        applicationHomeURL.appendPathComponent("settings.json")
        return applicationHomeURL
    }

    init() {
        fileManager = FileManager.default
    }
    
    func createSettingsFolder() {
        do {
            try fileManager.createDirectory(at: applicationHomeURL,
                                            withIntermediateDirectories: false,
                                            attributes: nil)
        } catch {
            print("error \(error)")
        }
    }
    
    func loadSettingsFile() -> String? {
        do {
            return try String(contentsOf: settingsFileURL)
        } catch {
            print("load error: \(error)")
            return nil
        }
    }
}
