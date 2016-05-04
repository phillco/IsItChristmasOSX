//
//  AppDelegate.swift
//  isitchristmas
//
//  Created by phil on 3/23/16.
//  Copyright © 2016 phillco. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength);

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // TODO: Make this more intellient before 2016-12-25
        let string = NSMutableAttributedString(string: "NO");
        string.beginEditing();
        string.addAttribute(NSFontAttributeName, value: NSFont.boldSystemFontOfSize(14), range: NSMakeRange(0, 2));
        string.endEditing();
        
        statusItem.attributedTitle = string;
        statusItem.toolTip = "It is not currently Christmas.";
        statusItem.action = #selector(statusItemClicked);
    }
    
    func statusItemClicked() {
        let menu = NSMenu();
        menu.addItem(NSMenuItem(title: "It is not currently Christmas.", action: nil, keyEquivalent: ""));
        menu.addItem(NSMenuItem.separatorItem());
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: ""));
        statusItem.popUpStatusItemMenu(menu);
    }
    
    func quit() {
        NSApplication.sharedApplication().terminate(self);
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}

