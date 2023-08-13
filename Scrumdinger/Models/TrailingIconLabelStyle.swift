//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Mirsadra on 2023. 07. 10..
/*
 Section 5
 Customize the label style
 Next, you’ll create a label style to stack the scrum length and clock icon horizontally. With the LabelStyle protocol, you can create a consistent design throughout your app by reusing the same label style for several views.
 */

import SwiftUI



// The configuration parameter is a LabelStyleConfiguration, which contains the icon and title views.
// These views represent the label’s image and label text.

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

/*
 Add an extension on LabelStyle that creates a static property named trailingIcon.
 Because you defined the label style as a static property, you can call it using leading-dot syntax, which makes your code more readable.
*/

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
