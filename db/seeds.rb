# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

["Ruby", "Java", "Node.js", "PHP", "Python", "Go"].each do |c|
  category = Category.create(name: c)
end
puts "6 categories created."

create_jobs = for i in 1..10 do

  job = Job.create!([title: "Job no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false", user_id: 1, category_id: 1])

end
puts "10 Public jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i+10}", description: "這是用種子建立的第 #{i+10} 個Hidden工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,is_hidden: "true", user_id: 1, category_id: 2])
end
puts "10 Hidden jobs created."



# Job.create!([title: "Java高级工程师", description: "1、负责互联网产品后端服务器架构设计，要求系统具有可扩展性， 能够支持大量并发用户；
# 2、根据产品需求完成服务器架构和模块设计、编码、测试以及文档编写等工作；
# 3、优化系统性能，保证服务器质量和性能。", wage_upper_bound: 30000, wage_lower_bound: 20000, is_hidden: "false"])




# Job.create!([title: "Key Account Manager", description: "1. Job purpose Enhance CB&GB team in Shanghai, and build strong relationship with customers.
  # 2. Key challenges (in first 6 – 12m) Know how to operate the REF business.
  # 3. It’s much different from tire and engine oil.Core Responsibilities BD new CB&GB customers.", wage_upper_bound: 50000, wage_lower_bound: 10000, is_hidden: "false"])
