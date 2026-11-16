//
//  TabBar.swift
//  AppInterFaceTemp
//
//  Created by Oscar Isberg on 16/11/2026.
//

import SwiftUI


enum Tab: String, CaseIterable {
    case home
    case search
    case favorite
    case settings
}



struct TabBar: View{

        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        @State var yOffset: CGFloat = 0
        @State var isTapped: Bool = false
        var body: some View {
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(
                        tab: tab,
                        selectedTab: $selectedTab,
                        namespace: namespace,
                        isTapped: $isTapped
                    )
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture{
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                            selectedTab = tab
                            isTapped = true
                            
                            //Reset the tap animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                isTapped = false
                            }
                            
                            //Add a little bounce effect
                            yOffset = 10
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.4)){
                                    yOffset = 0
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
        }
}


struct TabButton: View {
    let tab: Tab
    @Binding var selectedTab: Tab
    var namespace: Namespace.ID
    @Binding var isTapped: Bool

    var body: some View {
        Text(tab.rawValue.capitalized)
            .font(.system(size: 14))
            .foregroundStyle(
                selectedTab == tab ? .blue : .gray
            )
            .scaleEffect(
                isTapped && selectedTab == tab ? 1.1 : 1.0
            )
    }
}
