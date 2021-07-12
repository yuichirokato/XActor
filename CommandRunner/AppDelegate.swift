//
//  AppDelegate.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/09.
//

import Cocoa
import CoreData
import SwiftUI
//
//struct PersistenceController {
//    static let shared = PersistenceController()
//
//    static var preview: PersistenceController = {
//        let controller = PersistenceController(inMemory: true)
//        return controller
//    }()
//
//    let container: NSPersistentContainer
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "Main")
//
//        if inMemory {
//            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//}

@main
class AppDelegate: NSObject, NSApplicationDelegate {
//    let persistenceController = PersistenceController.shared

    var window: NSWindow!
    var statusBarItem: NSStatusItem!
    var popover: NSPopover!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // configure statusbar
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        guard let button = statusBarItem.button else { return }
        button.image = NSImage(systemSymbolName: "checkmark.circle.fill", accessibilityDescription: nil)
        button.action = #selector(showHidePopover(_:))
        
        // configure popover
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 350, height: 500)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        self.popover = popover
        
        FileUtil().createSettingsFolder()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showHidePopover(_ sender: NSStatusBarButton) {
        guard let button = statusBarItem.button else { return }
        
        if popover.isShown {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            popover.contentViewController?.view.window?.becomeKey()
        }
    }
}

