//
//  EventID.swift
//  TimeSplit3
//
//  Created by Pete Misik on 2/3/21.
//

import SwiftUI

struct EventID: View {
    let sampleIDs = [TrainingID(item: "AT59Y"), TrainingID(item: "AN11Y"), TrainingID(item: "AP15Y"),
                     TrainingID(item: "AP41Y"), TrainingID(item: "AP23Y"), TrainingID(item: "AP33Y"),
                     TrainingID(item: "ALOY1"), TrainingID(item: "AL11Y"), TrainingID(item: "AL51Y"),
                     TrainingID(item: "AL55Y"), TrainingID(item: "AN35Y"), TrainingID(item: "RU01Y"),
                     TrainingID(item: "RUO3Y"), TrainingID(item: "RU17Y"), TrainingID(item: "AF31Y"),
                     TrainingID(item: "TWO1Y"), TrainingID(item: "TW5OY"), TrainingID(item: "TW2OY"),
                     TrainingID(item: "AN21Y")]
    var body: some View {
        VStack(spacing: 5) {
            Cell_label(text: "Event ID", color: Color.gray)
            ForEach(sampleIDs, id:\.id) { item in
                Cell_label(text: item.item, color: Color.black)
            }
        }
    }
}

struct EventID_Previews: PreviewProvider {
    static var previews: some View {
        EventID()
    }
}


struct TrainingID: Identifiable {
    var id = UUID()
    var item: String
}
