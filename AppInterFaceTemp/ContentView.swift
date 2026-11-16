import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @Namespace private var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab){
                HomeScreen()
                    .tag(Tab.home)
                    .ignoresSafeArea(.keyboard)
                SeachScreen()
                    .tag(Tab.search)
                    .ignoresSafeArea(.keyboard)
                FavoriteScreen()
                    .tag(Tab.favorite)
                    .ignoresSafeArea(.keyboard)
                SettingsScreen()
                    .tag(Tab.settings)
                    .ignoresSafeArea(.keyboard)
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            TabBar(selectedTab: $selectedTab, namespace: animation)
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
