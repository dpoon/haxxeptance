//
//  AppDelegate.swift
//  Haxxeptance
//
//  Created by Dara Poon on 2020-05-01.
//  Copyright © 2020 Dara Poon. All rights reserved.
//

import Cocoa

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let regex:NSRegularExpression = try! NSRegularExpression(
        pattern: "^hxxp(s?):", options: NSRegularExpression.Options.caseInsensitive
    )

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Installed handler for hxxp: and hxxps: URL schemes.")
        NSApplication.shared.terminate(self)
    }

    //func applicationWillTerminate(_ aNotification: Notification) {
    //    debugPrint("terminating")
    //}

    func application(_ application: NSApplication, open urls: [URL]) {
        urls.forEach { (origUrl) in
            guard let goodUrl = URL(string: regex.stringByReplacingMatches(
                in: origUrl.description,
                range: NSMakeRange(0, min("hxxps:".count, origUrl.description.count)),
                withTemplate: "http$1:"
            )) else {
                return
            }
            NSWorkspace.shared.open(goodUrl)
        }
    }
}
