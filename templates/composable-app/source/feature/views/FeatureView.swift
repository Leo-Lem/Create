
import SwiftUI

struct FeatureView: View {
  var body: some View {
    Text("View")
  }

  @EnvironmentObject private var mainState: MainState
}

// MARK: - (PREVIEWS)

struct FeatureView_Previews: PreviewProvider {
  static var previews: some View {
    FeatureView()
  }
}