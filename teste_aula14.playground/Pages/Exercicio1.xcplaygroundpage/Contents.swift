//: [Previous](@previous)
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
    var cep: String
    var uf: UFData
    var description: String {
        return String("\(street), \(number), \(addressComplement) - \(district) - \(city) - \(uf)")
    }
    
    init(street: String, number: Int, addressComplement: String?, district: String, city: String, cep: String, uf: UFData) {
        self.street = street
        self.number = number
        self.addressComplement = addressComplement
        self.district = district
        self.city = city
        self.cep = cep
        self.uf = uf

    }
}
enum EmailType {
    case personal
    case professional
}

class Email {
    var address: String
    var type: EmailType
    
    init(address: String, type: EmailType) {
        self.address = address
        self.type = type
    }
    
}

class Employee {
    var name: String
    var birthDate: String
    var emails: [Email]
    var address: Address
    
    init(name: String, birthDate: String, emails: [Email], address: Address) {
        self.name = name
        self.birthDate = birthDate
        self.emails = emails
        self.address = address
        
    }
    
}

class Intern: Employee {
    var hireDate: String
    var contractFinalDate: String
    var valueOfBenefit: Float
    var pixKey: String
    
    init(name: String, birthDate: String, emails: [Email], address: Address, hireDate: String, contractFinalDate: String, valueOfBenefit: Float, pixKey: String) {
        
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.valueOfBenefit = valueOfBenefit
        self.pixKey = pixKey
        
        super.init(name: name, birthDate: birthDate, emails: emails, address: address)
    }
}

class CLT: Employee {
    var hireDate: String
    var jobRole: String
    var salary: Double
    var agency: String
    var accountNumber: String
    
    init(name: String, birthDate: String, emails: [Email], address: Address, hireDate: String, jobRole: String, salary: Double, agency: String, accountNumber: String) {
        
        self.hireDate = hireDate
        self.jobRole = jobRole
        self.salary = salary
        self.agency = agency
        self.accountNumber = accountNumber
        
        super.init(name: name, birthDate: birthDate, emails: emails, address: address)
    }
}

class PJ: Employee {
    var hireDate: String
    var contractFinalDate: String
    var hourValue: Double
    var agreedMonthlyMinHours: Float
    var pixKey: String
    
    init(name: String, birthDate: String, emails: [Email], address: Address, hireDate: String, contractFinalDate: String, hourValue: Double, agreedMonthlyMinHours: Float, pixKey: String) {
        
        self.hireDate = hireDate
        self.contractFinalDate = contractFinalDate
        self.hourValue = hourValue
        self.agreedMonthlyMinHours = agreedMonthlyMinHours
        self.pixKey = pixKey
        
        super.init(name: name, birthDate: birthDate, emails: emails, address: address)
    }
}

class Company {
    var interns: [Intern]
    var clts: [CLT]
    var pjs: [PJ]
    
    init(interns: [Intern], clts: [CLT], pjs: [PJ]) {
        self.interns = interns
        self.clts = clts
        self.pjs = pjs
    }
    
    var salariesAmount: Float = 0
    
    func calcuteWholeCompanySalaries() -> Float {
        for intern in self.interns {
            salariesAmount += intern.valueOfBenefit
          }
        
        for clt in self.clts {
            salariesAmount += Float(clt.salary)
              
          }
        
          for pj in self.pjs {
              let total = Float(pj.agreedMonthlyMinHours) * Float(pj.hourValue)
              salariesAmount += total
              
          }
          
          return salariesAmount
      }
    
    
    func calcProfit(projects: [ProjectData]) -> Float {
        var profit: Float = 0
        for project in projects {
            profit += project.calcLiquidPrice()
        }
        
        return profit
    }
}

class ProjectData: Company {
    var projectName: String
    var grossValue: Float
    
    init(interns: [Intern], clts: [CLT], pjs: [PJ], projectName: String, grossValue: Float) {
        self.projectName = projectName
        self.grossValue = grossValue
        
        super.init(interns: interns, clts: clts, pjs: pjs)
    }
    
    
    func calcLiquidPrice() -> Float {
         self.grossValue - calcuteWholeCompanySalaries()
    }
}


var emailList = [Email(address: "PEDRO@GMAI", type: EmailType.personal)]

var address = Address(street: "", number: 23, addressComplement: "apr", district: "occo", city: "fds", cep: "673249324", uf: UFData.RS)

var intern1 = Intern(name: "", birthDate: "", emails: emailList, address: address, hireDate: "00/00/00", contractFinalDate: "00/00/00", valueOfBenefit: 100.0, pixKey: "32478")

var clt1 = CLT(name: "", birthDate: "", emails: emailList, address: address, hireDate: "00/000//00", jobRole: "", salary: 100.0, agency: "", accountNumber: "")

var pj1 = PJ(name: "", birthDate: "", emails: emailList, address: address, hireDate: "", contractFinalDate: "", hourValue: 20, agreedMonthlyMinHours: 10, pixKey: "")

var project1 = ProjectData(interns: [intern1], clts: [clt1], pjs: [pj1], projectName: "projeto1", grossValue: 500.0)

var empresa1 = Company(interns: [intern1], clts: [clt1], pjs: [pj1])

//print(empresa1.calcuteWholeCompanySalaries())
//print(project1.calcLiquidPrice())
//print(empresa1.calcProfit(projects: [project1]))
//: [Next](@next)
