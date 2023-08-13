//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Mirsadra on 2023. 08. 13..
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: ThemeMe
    
    var body: some View {
        
        Picker("Theme", selection: $selection) {
            ForEach(ThemeMe.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
