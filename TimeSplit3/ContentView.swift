//
//  ContentView.swift
//  TimeSplit3
//
//  Created by John Bethancourt on 2/1/21.
//

import SwiftUI
import CoreData

//extension Mission {
//    static func allEntityNameFetchRequest() -> NSFetchRequest<EntityName> {
//        let request: NSFetchRequest<Mission> = EntityName.fetchRequest() as! NSFetchRequest<Mission>
//        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//        return request
//    }
//}
struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext


   // NSFetchRequest<Mission>(entityName: "Mission")
   
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Mission.name, ascending: true)],
        animation: .default)
    private var missions: FetchedResults<Mission>
    
    var body: some View {
        
        VStack{
            Text("Test")
            Text(missions.first?.name ?? "No can")
        }
        
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
