import SwiftUI

struct Restaurant {
    var id = UUID ()
    var name: String
    var image: String
}

struct ContentView: View {
    init(){
        let navAppearence = UINavigationBarAppearance()
        navAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "Arial", size: 35)!]
        navAppearence.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "Arial", size: 20)!]
        navAppearence.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().standardAppearance = navAppearence
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearence
        UINavigationBar.appearance().compactAppearance = navAppearence
        UINavigationBar.appearance().tintColor = .black
    }
    
    var restaurant = [Restaurant(name: "cafedeadend", image: "cafedeadend"), Restaurant(name: "Homei", image: "homei"),Restaurant(name: "Teakha", image: "teakha"),Restaurant(name:"For Kee Restaurant", image:"Upstate"),Restaurant(name: "Homei", image: "cafedeadend")]
    
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petit e Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli" , "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donos tia", "Royal Oak", "CASK Pub and Kitchen"]
//
//    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petite oyster", "cafedeadend", "posatelier", "bourkestreetbakery", "haighschocolate" , "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "five leaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpub kitchen"]
    
    var body: some View {
//        List{
////            Text("objet1")
////            Text("objet2")
////            Text("objet3")
////            Text("objet4")
//            ForEach(restaurantNames, id: \.self){ index in
//                Text("\(index)")
//            }
//        }
        
       
        NavigationView{
            List(restaurant, id:\.id) { resto in
                NavigationLink(destination:RestaurantDetailView(restaurant: resto)){
                    BasicImageRow(restaurant: resto)
                }
               
        }
            .navigationBarTitle("Restaurant", displayMode: .automatic )
        }
            
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        
        HStack{
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text("\(restaurant.name)")
        }
    }
}
    struct RestaurantDetailView: View {
        var restaurant: Restaurant
        var body: some View {
            
            VStack{
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("\(restaurant.name)")
                Spacer()
            }
        }
    }
}
