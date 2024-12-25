import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = BurgerViewModel()
    @State private var searchText = ""

    private let categories = ["All", "Wendy's Burger", "Hamburger"]

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                headerSection(geometry: geometry)
                ScrollView {
                    contentSection()
                    categorySection()
                    burgerGrid()
                }
            }
        }
    }
}

// MARK: - Extensions
extension HomeScreen {
    private func headerSection(geometry: GeometryProxy) -> some View {
        HStack {
            Text("Foodgo")
                .font(.custom("Lobster-Regular", size: geometry.size.width * 0.13))
                .foregroundColor(Color(hex: "#3C2F2F"))
            Spacer()
            Image("girl")
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width * 0.13, height: geometry.size.width * 0.15)
        }
        .padding()
        .frame(width: geometry.size.width, height: geometry.size.height * 0.09)
    }

    private func contentSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Order your favourite food!")
                .font(.custom("Poppins-Medium", size: 18))
                .foregroundColor(Color(hex: "#6A6A6A"))
                .padding(.horizontal)

            HStack(spacing: 16) {
                searchBar()
                filterButton()
            }
            .padding(.horizontal)
        }
    }

    private func categorySection() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        viewModel.selectedCategory = category
                    }) {
                        Text(category)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                viewModel.selectedCategory == category ? Color(hex: "#EF2A39") : Color(hex: "#F5F5F5")
                            )
                            .foregroundColor(viewModel.selectedCategory == category ? .white : Color(hex: "#6A6A6A"))
                            .cornerRadius(20)
                            .shadow(color: viewModel.selectedCategory == category ? Color.gray.opacity(0.3) : .clear, radius: 5, x: 0, y: 4)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 16)
    }

    private func burgerGrid() -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(viewModel.filteredBurgers) { burger in
                VStack {
                    Image(burger.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .cornerRadius(10)

                    Text(burger.name)
                        .font(.headline)
                        .foregroundColor(.black)

                    Text(burger.type)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", burger.rating))
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
            }
        }
        .padding()
    }

    private func searchBar() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(hex: "#3C2F2F"))
            TextField("Search", text: $searchText)
                .font(.system(size: 18))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
    }

    private func filterButton() -> some View {
        Button(action: {}) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color(hex: "#EF2A39"))
                .cornerRadius(15)
        }
    }
}

#Preview {
    HomeScreen()
}
