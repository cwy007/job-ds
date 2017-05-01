# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建 30 個 public jobs, 以及39個hidden jobs"

create_account = User.create([email: '101@qq.com',name: "fullStack", password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

["后端开发", "移动开发", "前端开发", "测试", "运维/技术支持", "项目管理"].each do |c|
  category = Category.create(name: c)
end
puts "6 categories created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作",
             wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
             is_hidden: "false", user_id: 1, category_id: 1, job_address: "北京"])

end
puts "20 Public jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i+10}", description: "這是用種子建立的第 #{i+10} 個Hidden工作",
              wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
              is_hidden: "true", user_id: 1, category_id: 2, job_address: "上海"])
end
puts "20 Hidden jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作",
               wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
               is_hidden: "false", user_id: 1, category_id: 3, job_address: "广州"])

end
puts "20 Public jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i+10}", description: "這是用種子建立的第 #{i+10} 個Hidden工作",
              wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
              is_hidden: "true", user_id: 1, category_id: 4, job_address: "深圳"])
end
puts "20 Hidden jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作",
                wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
                is_hidden: "false", user_id: 1, category_id: 5, job_address: "郑州"])

end
puts "20 Public jobs created."

create_jobs = for i in 1..10 do

  Job.create!([title: "Job no.#{i+10}", description: "這是用種子建立的第 #{i+10} 個Hidden工作",
              wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,
              is_hidden: "true", user_id: 1, category_id: 6, job_address: "杭州"])
end
puts "20 Hidden jobs created."
