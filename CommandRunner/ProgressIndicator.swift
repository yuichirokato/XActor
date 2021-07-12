//
//  ActivityIndicator.swift
//  CommandRunner
//
//  Created by Yuichirou Takahashi on 2021/07/09.
//

import Cocoa
import SwiftUI

struct ProgressIndicator: NSViewRepresentable {
    typealias NSViewType = NSProgressIndicator
    
    @Binding var isAnimating: Bool
    
    let style: NSProgressIndicator.Style
    
    func makeNSView(context: Context) -> NSProgressIndicator {
        let indicator = NSProgressIndicator()
        indicator.style = style
        return indicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        isAnimating ? nsView.startAnimation(nil) : nsView.stopAnimation(nil)
    }
}


