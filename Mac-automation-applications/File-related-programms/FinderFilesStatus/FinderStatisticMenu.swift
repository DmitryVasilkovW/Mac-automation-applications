import SwiftUI

struct ContentView: View
{

    var body: some View 
    {
        VStack 
        {
            Text("get statistic")
            Button(action: {
                countFileTypesOnDesktop()
            }) 
            {
                Text("Call My Function")
            }
        }
    }
}

@main
struct MyApp: App
{
    var body: some Scene 
    {
        WindowGroup 
        {
            ContentView()
        }
    }
}
