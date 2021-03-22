//
//  SettingsView.swift
//  Time Of Work (iOS)
//
//  Created by Robert Adamczyk on 21.03.21.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView{
            ZStack{
                Color(colorScheme == .light ? "BackgroundColor" : "Black")
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    AddEditHeaderView(value: "Settings")
                    NavigationLink(destination: TimeSettingView()) {
                        MenuSettingRow(name: "Time")
                            .backgroundWithBottomTop
                    }
                    
                    Spacer()
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarHidden(true)
        }
        .ignoresSafeArea()
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
