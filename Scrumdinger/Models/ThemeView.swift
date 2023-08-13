//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Mirsadra on 2023. 08. 13..
//

import SwiftUI

struct ThemeView: View {
    let theme: ThemeMe
    
    var body: some View {
        Text(theme.name)
            .padding(5)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
