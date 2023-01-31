//
//  ContentView.swift
//  SDUI
//
//  Created by Narendar Singh Saini on 21/10/22.
//

import SwiftUI

let json =

"""

{
  "components": [
    {
      "identifier": "IMAGE",
      "image": "redrose"
    },
    {
      "identifier": "CAROUSEL",
      "list": [
        {
          "image": "sunflower",
          "title": "Sun Flower"
        },
        {
          "image": "redrose",
          "title": "Red Rose"
        },
        {
          "image": "jasmin",
          "title": "Jasmin"
        }
      ]
    },
    {
      "identifier": "LIST",
      "list": [
        {
          "image": "sunflower",
          "title": "Sun Flower",
          "subTitle": "Sun flower is yellow"
        },
        {
          "image": "jasmin",
          "title": "Jasmin",
          "subTitle": "Jasmin is white in color"
        },
        {
          "image": "pinkrose",
          "title": "Pink Rose",
          "subTitle": "Pink rose is pink in color"
        },
        {
          "image": "redrose",
          "title": "Red Rose",
          "subTitle": "Red rose is red in color"
        },
        {
          "image": "lotus",
          "title": "Lotus",
          "subTitle": "Lotus is pink in color"
        }
      ]
    }
  ]
}

"""

protocol Component: Decodable {
    var type: String { get }
    func renderView() -> AnyView
}

enum ComponentType: String, Decodable {
    
    case image      = "IMAGE"
    case carousel   = "CAROUSEL"
    case list       = "LIST"
    
    var metatype: Component.Type {
        switch self {
        case .image:    return ImageComponent.self
        case .carousel: return CarouselComponent.self
        case .list:     return ListComponent.self
        }
    }
}

struct ImageComponent: Component {
    
    var type: String {
        return ComponentType.image.rawValue
    }
    
    func renderView() -> AnyView {
        
        let view = Image(image)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .padding(30)
            .frame(width: 250, height: 250)
        
        return AnyView(view)
    }
    
    let image: String
}

struct CarouselComponent: Component {
    
    var type: String {
        return ComponentType.carousel.rawValue
    }
    
    func renderView() -> AnyView {
        
        let view = ScrollView (.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0..<list.count, id: \.self) { index in
                    VStack() {
                        Image(list[index].image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(100)
                        Text("\(list[index].title)")
                    }.padding()
                }
            }
        }
        return AnyView(view)
    }
    
    struct Flower: Decodable {
        let image: String
        let title: String
    }
    
    let list: [Flower]
}

struct ListComponent: Component {
    
    var type: String {
        return ComponentType.list.rawValue
    }
    
    func renderView() -> AnyView {
        
        let view = ScrollView (.horizontal, showsIndicators: false) {
            ForEach(0..<list.count, id: \.self) { index in
                HStack() {
                    Image(list[index].image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .cornerRadius(100)
                    VStack(alignment: .leading) {
                        Text("\(list[index].title)").bold()
                        Text("\(list[index].subTitle)")
                    }
                    Spacer()
                }
                .padding(20)
            }
        }
        return AnyView(view)
    }
    
    struct Flower: Decodable {
        let image: String
        let title: String
        let subTitle: String
    }
    
    let list: [Flower]
}

final class AnyComponent: Decodable {
    
    private enum CodingKeys: CodingKey {
        case identifier
    }
    
    let component: Component?
    
    required init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(ComponentType.self, forKey: .identifier)
            self.component = try type.metatype.init(from: decoder)
        } catch let error {
            print(error)
            self.component = nil
        }
    }
}

struct Response: Decodable {
    
    private enum CodingKeys: CodingKey {
        case components
    }
    
    let components: [Component]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.components = try container.decode([AnyComponent].self,
                                               forKey: .components).compactMap { $0.component }
    }
    
    init(components: [Component]) {
        self.components = components
    }
}

func jsonToObject() -> Response? {
    
    let jsonData = Data(json.utf8)
    let decoder = JSONDecoder()
    
    do {
        let flowerData = try decoder.decode(Response.self, from: jsonData)
        return flowerData
    } catch let error {
        print(error)
    }
    return nil
}

struct ContentView: View {
    
    var components: [Component] = []
    
    init() {
        componentsBuilder()
    }
    
    mutating func componentsBuilder() {
        
        let data = jsonToObject()
        
        if let data = data {
            
            for c in data.components {
                
                if c.type == ComponentType.image.rawValue {
                    
                    let imageComponent: ImageComponent = c as! ImageComponent
                    components.append(ImageComponent(image:imageComponent.image))
                    
                } else if c.type == ComponentType.carousel.rawValue {
                    
                    let carouselComponent: CarouselComponent = c as! CarouselComponent
                    components.append(CarouselComponent(list: carouselComponent.list))
                    
                } else if c.type == ComponentType.list.rawValue {
                    
                    let listComponent: ListComponent = c as! ListComponent
                    components.append(ListComponent(list: listComponent.list))
                }
            }
        }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(self.components, id: \.type) { component in
                component.renderView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
