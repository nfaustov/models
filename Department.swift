enum Department: String, Codable, Hashable, CaseIterable, Identifiable, Comparable {
    case gynecology = "Гинекология"
    case obstetrics = "Акушерство"
    case therapy = "Терапия"
    case urology = "Урология"
    case ultrasound = "Ультразвуковая диагностика"
    case gastroenterology = "Гастроэнтерология"
    case endocrinology = "Эндокринология"
    case cardiology = "Кардиология"
    case vascularSurgery = "Сердечно-сосудистая хирургия"
    case functionalDiagnostics = "Функциональная диагностика"
    case neurology = "Неврология"
    case cosmetology = "Косметология"
    case laboratory = "Лабораторные исследования"
    case procedure = "Процедурный кабинет"

    var specialization: String {
        switch self {
        case .gynecology: return "Гинеколог"
        case .obstetrics: return "Акушер-гинеколог"
        case .therapy: return "Терапевт"
        case .urology: return "Уролог"
        case .ultrasound: return "Врач УЗИ"
        case .gastroenterology: return "Гастроэнтеролог"
        case .endocrinology: return "Эндокринолог"
        case .cardiology: return "Кардиолог"
        case .vascularSurgery: return "Сосудистый хирург"
        case .functionalDiagnostics: return "Врач функциональной диагностики"
        case .neurology: return "Невролог"
        case .cosmetology: return "Косметолог"
        case .laboratory: return "Лаборант"
        case .procedure: return "Медицинская сестра"
        }
    }

    private var order: Int {
        switch self {
        case .gynecology:
            1
        case .obstetrics:
            2
        case .therapy:
            4
        case .urology:
            3
        case .ultrasound:
            0
        case .gastroenterology:
            10
        case .endocrinology:
            9
        case .cardiology:
            5
        case .vascularSurgery:
            6
        case .functionalDiagnostics:
            7
        case .neurology:
            8
        case .cosmetology:
            11
        case .laboratory:
            13
        case .procedure:
            12
        }
    }

    var id: Self {
        self
    }

    static func < (lhs: Department, rhs: Department) -> Bool {
        lhs.order > rhs.order
    }
}
