class Student
    attr_reader :first_name
    @@all = []

    def self.all
        @@all
    end

    def self.find_student(name)
        self.all.select {|student| student.first_name == name}
    end

    def initialize(first_name)
        @first_name = first_name
        @@all << self

    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def all_instructors
        tests.map {|test| test.instructor}
    end

    def tests
        BoatingTest.all.select {|test| test.student == self }
    end

    def grade_percentage
        #return percentage of passed
        (tests.count {|test| test.test_status == "passed"} * 1.0 / tests.length)
    end

end
