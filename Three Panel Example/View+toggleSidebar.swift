//
//  View+toggleSidebar.swift
//  Telemetry Viewer (iOS)
//
//  Created by Daniel Jilg on 03.03.21.
//

import SwiftUI
import AppKit

extension View {
    func getSplitViewItems() -> [NSSplitViewItem]? {
        guard
            let mainView = NSApp.keyWindow?.contentView,
            
            let splitView = mainView.findViews(subclassOf: NSSplitView.self).first,
            let splitViewItems = (splitView.delegate as? NSSplitViewController)?.splitViewItems
        else { return nil }

        return splitViewItems
    }

    func getRightSidebarSplitViewItem() -> NSSplitViewItem? {
        guard
            let splitViewItems = getSplitViewItems(),
            let rightMostSplitItem = splitViewItems.last
        else { return nil }

        return rightMostSplitItem
    }

    func toggleRightSidebar() {
        getRightSidebarSplitViewItem()?.animator().isCollapsed.toggle()
    }

    func expandRightSidebar() {
        getRightSidebarSplitViewItem()?.animator().isCollapsed = false
    }

    /// Find all split view items and set their minimum thickness to a sane value.
    ///
    /// This should be called at app startup in order to prevent sidebars being open, but so
    /// small they are invisible.
    func setupSidebars() {
        guard let splitViewItems = getSplitViewItems() else { return }

        splitViewItems.forEach { $0.minimumThickness = 250 }
        splitViewItems.last?.maximumThickness = 250
    }
}

extension NSView {
    func findViews<T: NSView>(subclassOf _: T.Type) -> [T] {
        recursiveSubviews.compactMap { $0 as? T }
    }

    var recursiveSubviews: [NSView] {
        subviews + subviews.flatMap(\.recursiveSubviews)
    }
}
