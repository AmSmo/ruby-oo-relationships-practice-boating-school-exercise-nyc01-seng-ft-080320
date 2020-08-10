class Instructor
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def passed_students
        passing_tests.map {|tests| tests.student }
    end

    def passing_tests
        tests.select {|test| test.test_status == "passed"} 
    end

    def tests
        BoatingTest.all.select{|test| test.instructor == self}
    end

    def all_students
        tests.map {|test| test.student}
    end

    def pass_student(student, test_name)
        grade_student(student, test_name, "pass")
    end
    
    def fail_student(student, test_name)
        grade_student(student, test_name, "failed")
    end

    def grade_student(student, test_name, grade)
        found_test = test_exist?(student, test_name)
        if found_test
            found_test.test_status = grade
        else
            BoatingTest.new(student, test_name, grade, self)
        end
    end

    def test_exist?(student, test_name)
        tests.find { |test| test.student == student && test.test_name == test_name}
    end


    
end
