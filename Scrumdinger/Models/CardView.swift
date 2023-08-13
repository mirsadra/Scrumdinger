//
//  CardView.swift
//  Scrumdinger
//
//  Created by Mirsadra Molaei on 2023. 06. 11..
/*
 Section 3
 Create the card view
 CardView will summarize the DailyScrum model data and display the title, the number of participants,
 and the duration.
 You’ll compose the CardView from smaller views, each of which displays a piece of data in the DailyScrum structure.
 You’ll update the structure CardView_Previews so that you get immediate visual feedback as you develop the view.
 */
/*
 Section 6
 Make the card view accessible
 CardView contains a label with an image of a clock and a number that represents meeting length.
 It also contains an image of people and a number of attendees.
 You’ll add accessibility labels that use string interpolation so that the labels become meaningful descriptions
 of the view.
 VoiceOver will read, “4 attendees” and “10 minute meeting.”
    Step 1
    - Apply the accessibilityAddTraits(.isHeader) modifier to the text view that displays the scrum’s title.
    - This modifier helps convey the information architecture of the view by reading the scrum title,
    followed by “heading.”
    Step 2
    - Use an accessibility modifier to add a label that describes the contents of the first Label in the HStack.
    Step 3
    - Add a similar accessibility modifier to the second Label in the HStack.
 */

import SwiftUI

// Add a constant named scrum of type DailyScrum (title, attendees, lengthInMinutes, and theme).
// The compiler generates an error because the CardView() initializer now requires a DailyScrum parameter.


struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(scrum.title)      // in CardView_Previews, changing x in sampleDataMe[x] changes title.
                .font(.headline)
                .accessibilityAddTraits(.isHeader) // Section 6, Step 1
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees") // S6, Step 2
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
//                    .padding(.trailing, 10)  // After I create TrailingIconLabelStyle.swift file, I changed it to:
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        // The accentColor variable defined in Theme.swift returns black for light-colored themes and white for dark-colored themes.
    }
}


// create a static variable named scrum, and pass it to the CardView initializer.
// Setting the preview layout and background color presents CardView as it’ll appear inside a List view.
// You’ll embed the view in a list in the next tutorial.

struct CardView_Previews: PreviewProvider {
    
    static var scrum = DailyScrum.sampleDataMe[0]  // change 0 to 1 or 2
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
        
    }
}
