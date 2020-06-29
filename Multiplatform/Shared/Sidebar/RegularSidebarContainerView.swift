//
//  SidebarView.swift
//  NetNewsWire
//
//  Created by Maurice Parker on 6/28/20.
//  Copyright © 2020 Ranchero Software. All rights reserved.
//

import SwiftUI

struct RegularSidebarContainerView: View {
	
	@EnvironmentObject private var sceneModel: SceneModel
	@StateObject private var sidebarModel = SidebarModel()
	
    var body: some View {
		SidebarView()
			.environmentObject(sidebarModel)
			.navigationTitle(Text("Feeds"))
			.listStyle(SidebarListStyle())
			.onAppear {
				sceneModel.sidebarModel = sidebarModel
				sidebarModel.delegate = sceneModel
				sidebarModel.rebuildSidebarItems()
			}
	}
}

struct RegularSidebarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        RegularSidebarContainerView()
			.environmentObject(SceneModel())
    }
}
