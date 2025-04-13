import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
                name: "Ha Long Bay",
                cityName: "Quảng Ninh",
                coordinates: CLLocationCoordinate2D(latitude: 20.9101, longitude: 107.1839),
                description: "Ha Long Bay is a UNESCO World Heritage Site known for its emerald waters and thousands of towering limestone islands topped with rainforests. It is one of Vietnam’s most famous natural wonders.",
                imageNames: [
                    "halong-bay-1",
                    "halong-bay-2",
                    "halong-bay-3"
                ],
                link: "https://en.wikipedia.org/wiki/Hạ_Long_Bay"
            ),
            Location(
                name: "Hoi An Ancient Town",
                cityName: "Quảng Nam",
                coordinates: CLLocationCoordinate2D(latitude: 15.8801, longitude: 108.3380),
                description: "Hoi An is a well-preserved example of a Southeast Asian trading port dating from the 15th to the 19th century. The town is famous for its old architecture, lanterns, and riverside ambiance.",
                imageNames: [
                    "hoi-an-1",
                    "hoi-an-2",
                    "hoi-an-3"
                ],
                link: "https://en.wikipedia.org/wiki/Hội_An"
            ),
            Location(
                name: "My Son Sanctuary",
                cityName: "Quảng Nam",
                coordinates: CLLocationCoordinate2D(latitude: 15.7742, longitude: 108.1253),
                description: "My Son is a cluster of abandoned and partially ruined Hindu temples constructed between the 4th and the 14th century AD by the kings of Champa. It is considered one of the foremost Hindu temple complexes in Southeast Asia.",
                imageNames: [
                    "my-son-1",
                    "my-son-2",
                    "my-son-3"
                ],
                link: "https://en.wikipedia.org/wiki/Mỹ_Sơn"
            ),
            Location(
                name: "Imperial City of Hue",
                cityName: "Huế",
                coordinates: CLLocationCoordinate2D(latitude: 16.4637, longitude: 107.5909),
                description: "The Imperial City of Hue was the former imperial capital of Vietnam. It is a vast complex of palaces, temples, walls, and gates representing the Nguyen dynasty's power and architecture.",
                imageNames: [
                    "hue-1",
                    "hue-2",
                    "hue-3"
                ],
                link: "https://en.wikipedia.org/wiki/Imperial_City,_Huế"
            ),
        Location(
                name: "Cu Chi Tunnels",
                cityName: "Ho Chi Minh City",
                coordinates: CLLocationCoordinate2D(latitude: 11.1467, longitude: 106.4992),
                description: "The Cu Chi Tunnels are an extensive network of underground tunnels used by the Viet Cong soldiers during the Vietnam War. Today, they are a popular tourist destination where visitors can experience what life was like underground.",
                imageNames: [
                    "cu-chi-tunnels-1",
                    "cu-chi-tunnels-2",
                    "cu-chi-tunnels-3"
                ],
                link: "https://en.wikipedia.org/wiki/Củ_Chi_tunnels"
            ),
    ]
}
