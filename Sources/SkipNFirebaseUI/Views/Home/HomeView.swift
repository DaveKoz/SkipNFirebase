import SkipFuseUI

struct HomeView: View {
    var body: some View {
        TabView {
            Screen1View()
                .tabItem {
                    Label("Screen 1", systemImage: "1.circle")
                }

            Screen2View()
                .tabItem {
                    Label("Screen 2", systemImage: "2.circle")
                }

            Screen3View()
                .tabItem {
                    Label("Screen 3", systemImage: "3.circle")
                }

            Screen4View()
                .tabItem {
                    Label("Screen 4", systemImage: "4.circle")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

