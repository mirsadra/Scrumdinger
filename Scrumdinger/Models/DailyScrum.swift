//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Mirsadra Molaei on 2023. 06. 11..

/* Section 2
 - Create a daily scrum model
 - The DailyScrum model will contain the following four properties, all with simple value types: title, attendees, lengthInMinutes, and theme
 Because DailyScrum will primarily carry value data, you'll make it a value type by declaring it as a struct.
    title: String
    attendees: [String]
    lengthInMinutes: Int
    theme: Theme */

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: ThemeMe
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: ThemeMe) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}


// extension will provide some sample data
extension DailyScrum {
    
    static let sampleDataMe: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Tweeg", "Rosemina", "Gorbe", "Bache"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                  attendees: ["Sadra", "ChatGPT", "Swift", "XCode"],
                  lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                  attendees: ["Firefly", "CodeSpace", "Google Hosting", "Cloud", "OpenAI"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
