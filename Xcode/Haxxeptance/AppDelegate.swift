//
//  AppDelegate.swift
//  Haxxeptance
//
//  Copyright © 2020 Dara Poon.
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    var appVersion: String {
        return ["CFBundleName", "CFBundleShortVersionString", "NSHumanReadableCopyright"].map {
            Bundle.main.object(forInfoDictionaryKey: $0) as! String
        }.joined(separator: " ")
    }
    
    let licenseSynopsis = """
    This program comes with ABSOLUTELY NO WARRANTY.  This is free software,
    and you are welcome to redistribute it under the terms of the GNU
    General Public License version 2 or later.
    """
    
    let regex:NSRegularExpression = try! NSRegularExpression(
        pattern: "^hxxp(s?):", options: NSRegularExpression.Options.caseInsensitive
    )

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print(appVersion)
        print()
        print(licenseSynopsis)
        print()
        print("Installed handler for hxxp: and hxxps: URL schemes.")
        NSApplication.shared.terminate(self)
    }

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
