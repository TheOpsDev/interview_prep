# https://xainey.github.io/2016/powershell-classes-and-concepts/#class-structure

class Student {

    # Properties
    [String]$Name
    [Int32[]]$Grades = @()

    # Constructor for object class
    Student([String]$Name) {
        $this.Name = $Name
    }

    # Overloaded constructor
    Student([String]$Name, [Int32[]]$Grades) {
        $this.Name = $Name
        $this.Grades += $Grades
    }

    # Method definition : [ReturnType] methodName([String]Param1, [Int]Param2)
    [String] GetName() {
        return $this.Name
    }

    [void] PrintValues() {
        Write-Host "Name`t: $($this.Name)"
        Write-Host "Grades`t: $($this.Grades)"
    }

    [void] AddGrade([Int32]$Grade) {
        $this.Grades += $Grade
    }
}

# Inheritance - ChildClass : Parent Class {}
class GradStudent : Student {
    
    [Bool]$PostGrade = $true
    [String]$Major

    # Call parent class constructor
    GradStudent([String]$Name) : base ($Name){ }
    
    # Overloaded child class constructor
    GradStudent([String]$Name, [Int32]$Grade) : base ($Name, $Grade){ }
 
    GradStudent([String]$Name, [Int32]$Grade, [String]$Major) : base ($Name, $Grade){
        $this.Major = $Major
    }

    [String] GetMajor() {
        return $this.Major
    }

    [void] ChangeMajor([String]$Major) {
        $this.Major = $Major
    }
}

class Course {

    [String]$CourseName
    [Student[]]$Enrolled = @()
    static [Int32]$Year = 2021
    
    Course([String]$Name) {
        $this.CourseName = $Name
    }

    Course([String]$Name, [Student[]]$Students) {
        $this.CourseName = $Name
        $this.Enrolled += $Students
    }

    [void] AddStudent([Student]$Student) {
        $this.Enrolled += $Student
    }

    [Student[]] GetEnrolledStudents() {
        return $this.Enrolled
    }

    [Int32] CalculateAvgGrade () {
        [System.Collections.ArrayList]$allGrades = @()
        $total = 0
        foreach ($student in $this.Enrolled) {
            foreach ($grade in $student.Grades) {
                $allGrades += $grade
                $total += $grade
            }
        }
        return ($total / $allGrades.Count)
    }
}


# Calling constructor, see line 7
$s1 = [Student]::new('Chris Herrera', 85)
$s2 = [Student]::new('Alexx Rodarte', 95)
$gs1 = [GradStudent]::new('Elliot Herrera', 100, 'Engineering')
$c1 = [Course]::new('CompSci', $s1)
$c1.AddStudent($s2)
$c1.AddStudent($gs1)
$c1.CalculateAvgGrade()
