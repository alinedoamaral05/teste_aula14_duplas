enum UFData {
    case RO
    case AC
    case AM
    case RR
    case PA
    case AP
    case TO
    case MA
    case PI
    case CE
    case RN
    case PB
    case PE
    case AL
    case SE
    case BA
    case MG
    case ES
    case RJ
    case SP
    case PR
    case SC
    case RS
    case MS
    case MT
    case GO
    case DF
}

class Address {
    var street: String
    var number: Int
    var addressComplement: String?
    var district: String
    var city: String
    var uf: UFData
    var description: String {
        return String("\(street), \(number), \(addressComplement) - \(district) - \(city) - \(uf)")
    }
    
    init(street: String, number: Int, addressComplement: String?, district: String, city: String, uf: UFData, description: String) {
        self.street = street
        self.number = number
        self.addressComplement = addressComplement
        self.district = district
        self.city = city
        self.uf = uf
    }
}

enum EmailType{
    case professional
    case personal
}

class Email {
    var emailAddress: String
    var type: EmailType
    
    init(emailAddress: String, type: EmailType) {
        self.emailAddress = emailAddress
        self.type = type
    }
}

class Collaborator {
    var fullName: String
    var birthdate: String
    var email: String
    var fullAddress: Address
    var cep: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String) {
        self.fullName = fullName
        self.birthdate = birthdate
        self.email = email
        self.fullAddress = fullAddress
        self.cep = cep
    }
}

class Intern: Collaborator {
    var hireDate: String
    var contractFinalDate: String
    var valueOfBenefit: Float
    var pixKey: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, contractFinalDate: String, valueOfBenefit: Float, pixKey: String) {
        
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.valueOfBenefit = valueOfBenefit
        self.pixKey = pixKey
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
    }
}

class CLT: Collaborator {
    var hireDate: String
    var jobRole: String
    var salary: Double
    var agency: String
    var accountNumber: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, jobRole: String, salary: Double, agency: String, accountNumber: String) {
        
        self.hireDate = hireDate
        self.jobRole = jobRole
        self.salary = salary
        self.agency = agency
        self.accountNumber = accountNumber
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
    }
}

class PJ: Collaborator {
    var hireDate: String
    var contractFinalDate: String
    var hourValue: Double
    var agreedMonthlyMinHours: Double
    var pixKey: String
    
    init(fullName: String, birthdate: String, email: String, fullAddress: Address, cep: String, hireDate: String, contractFinalDate: String, hourValue: Double, agreedMonthlyMinHours: Double, pixKey: String) {
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.hourValue = hourValue
        self.agreedMonthlyMinHours = agreedMonthlyMinHours
        self.pixKey = pixKey
        
        super.init(fullName: fullName, birthdate: birthdate, email: email, fullAddress: fullAddress, cep: cep)
    }
}

class Company {
    var interns: [Intern]
    var clts: [CLT]
    var pjs: [PJ]
    var valorLíquido: Float = 0.0
    var projectData: [ProjectData]
    
    init(intern: [Intern], clt: [CLT], pj: [PJ], projectData: [ProjectData]) {
        self.interns = intern
        self.clts = clt
        self.pjs = pj
        self.projectData = projectData
    }
    func MonthlyProfit() -> String {
        for wage in interns {
            valorLíquido += Float(wage.valueOfBenefit)
        }
        for wage in self.clts {
            wage.salary
            valorLíquido += Float(wage.salary)
        }
        
        for wage in self.pjs {
            let total = Float(wage.agreedMonthlyMinHours) * Float(wage.hourValue)
            valorLíquido += total
        }
        for valorProjeto in projectData {
            valorLíquido += valorProjeto.valorBrutoProjeto
        }
        return "O lucro mensal da empresa é de \(valorLíquido)"
    }
}

class ProjectData {
    var projectName: String
    var valorBrutoProjeto: Float
    var ProjectSalaryAmount: Float = 0.0
    var interns: [Intern]
    var clts: [CLT]
    var pjs: [PJ]
    
    init(projectName: String, valorBrutoProjeto: Float, interns: [Intern], clts: [CLT], pjs: [PJ]) {
        self.projectName = projectName
        self.valorBrutoProjeto = valorBrutoProjeto
        self.interns = interns
        self.clts = clts
        self.pjs = pjs
    }
    
    func calcuteWholeProjectSalaries() -> String {
        for wage in interns {
            wage.valueOfBenefit
            ProjectSalaryAmount += Float(wage.valueOfBenefit)
        }
        
        for wage in self.clts {
            wage.salary
            ProjectSalaryAmount += Float(wage.salary)
        }
        
        for wage in self.pjs {
            let total = Float(wage.agreedMonthlyMinHours) * Float(wage.hourValue)
            ProjectSalaryAmount += total
            
        }
        
        return "O valor líquido do projeto é de \(valorBrutoProjeto - ProjectSalaryAmount)"
    }
    
}


var personIn = Intern(fullName: "Pedro Grando", birthdate: "03/11/2003", email: "exemplpo", fullAddress: Address(street: "abc", number: 123, addressComplement: "ap 203", district: "bairro", city: "gylef", uf: UFData.BA, description: ""), cep: "0000", hireDate: "25/11/1998", contractFinalDate: "25/11/2010", valueOfBenefit: 600.10, pixKey: "0538462436564")

var personPJ = PJ(fullName: "Pedro Grando", birthdate: "Pedro Grando", email: "Pedro Grando", fullAddress: Address(street: "Pedro Grando", number: 21, addressComplement: "Pedro Grando", district: "Pedro Grando", city: "Pedro Grando", uf: UFData.BA, description: ""), cep: "Pedro Grando", hireDate: "Pedro Grando", contractFinalDate: "Pedro Grando", hourValue: 30, agreedMonthlyMinHours: 40, pixKey: "Pedro Grando")

var personClt = CLT(fullName: "sa", birthdate: "g", email: "sa", fullAddress: Address(street: "sa", number: 12, addressComplement: "sa", district: "sa", city: "sa", uf: UFData.BA, description: ""), cep: "sa", hireDate: "sa", jobRole: "sa", salary: 2000.0, agency: "sa", accountNumber: "sa")

var projeto = ProjectData(projectName: "sasa", valorBrutoProjeto: 12222, interns: [personIn], clts: [personClt], pjs: [personPJ])

projeto.calcuteWholeProjectSalaries()
var ogitrov = Company(intern: [personIn], clt: [personClt], pj: [personPJ], projectData: [projeto])
ogitrov.MonthlyProfit()
