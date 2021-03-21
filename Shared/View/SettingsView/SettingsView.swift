//
//  SettingsView.swift
//  Time Of Work (iOS)
//
//  Created by Robert Adamczyk on 21.03.21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel : SettingsViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack(alignment: .top){
            Color(colorScheme == .light ? "BackgroundColor" : "Black")
                .ignoresSafeArea()
            if viewModel.view == .menu {
                MenuSettingView()
            }
            if viewModel.view == .workTime {
                Color.blue
                    .ignoresSafeArea()
                    .transition(.move(edge: .trailing))
            }
            AddEditHeaderView(value: "Settings")
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
