final class PricelistItem {
    private(set) var id: String = ""
    var category: Department = Department.gynecology
    var title: String = ""
    var price: Double = Double.zero
    var costPrice: Double = Double.zero
    var archived: Bool = false
    var fixedSalary: Double? = nil
    var fixedAgentFee: Double? = nil
    var treatmentPlans: [TreatmentPlan.Kind] = []

    var doctors: [Doctor]?

    init(
        id: String,
        category: Department,
        title: String,
        price: Double,
        costPrice: Double = 0,
        fixedSalary: Double? = nil,
        fixedAgentFee: Double? = nil
    ) {
        self.id = id
        self.category = category
        self.title = title
        self.price = price
        self.costPrice = costPrice
        archived = false
        self.fixedSalary = fixedSalary
        self.fixedAgentFee = fixedAgentFee

        if category == .laboratory {
            treatmentPlans = [.pregnancy, .basic]
        } else {
            treatmentPlans = []
        }
    }
}
