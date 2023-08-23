//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Mirsadra on 2023. 08. 14..
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    
    var skipAction: ()->Void // allow users to skip to the next speaker.
    
    // ScrumTimer marks each speaker as completed when their time has ended.
    // The first speaker not marked as completed becomes the active speaker.
    // The speakerNumber property uses the index to return the active speaker number,
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    // This property is true if the isCompleted property of each speaker except the final speaker is true.
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy{ $0.isCompleted }
    }
    
    // returns information about the active speaker, and pass it to the Text view.
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button (action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleDataMe[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
