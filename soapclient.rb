require 'savon'

client = Savon.client(
    wsdl: 'http://localhost:8080/ws-textbook-ex03-studentRegistrySoap/StudentRegistryService?WSDL'
  ) do
  convert_request_keys_to :lower_camelcase
end

rs = client.call(:read_student,
            message: {
                request: {
                    studentId: 1
                }
            })
puts 'All courses'
courses = rs.body[:read_student_response][:response][:student][:courses]
courses.each do |c|
  puts "#{c[:code]}, #{c[:credits]}, #{c[:grade]}, #{c[:title]}"
end

puts 'Courses count by letter grade group:'
courses.group_by {|c| c[:grade][0]}.each do |grade, courses_of_grade|
  puts "#{grade} -> #{courses_of_grade.length}"
end