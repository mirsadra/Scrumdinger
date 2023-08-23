//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Mirsadra Molaei on 2023. 06. 10..
//

import SwiftUI

 @main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleDataMe
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
