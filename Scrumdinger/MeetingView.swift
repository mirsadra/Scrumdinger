//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mirsadra Molaei on 2023. 06. 10..
//

import SwiftUI


struct MeetingView: View {
    
    var theme: ThemeMe = .sky
    @State private var prog = 0.8

    
    var body: some View {
        VStack {
            ProgressView(value: prog)
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Remaining")
            .accessibilityValue("10 minutes")
            
            ZStack {
                Circle()
                    .strokeBorder()
                ProgressView(value: prog)
                    .progressViewStyle(.circular)
            }
    
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button (action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}


struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
