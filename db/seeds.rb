# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'admin@example.com',name: "admin", password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

categories = ["后端开发", "移动开发", "前端开发", "测试", "运维/技术支持", "项目管理"]
companies  = ["京东", "汽车之家", "腾讯", "华为", "美团", "阿里巴巴"]
addresses  = ["北京", "上海", "杭州", "深圳", "南京"]

categories.each do |category|
  category = Category.create(name: category)
end
puts "6 categories created."

companies.each do |company|
  10.times do |i|
    hide = i + 1 > 5 ? true : false

    Job.create!(
                 title: "Job no.#{i + 1}",
           description: "这是种子档案建立的第 #{i + 1} 个Public工作",
      wage_upper_bound: rand(10..20)*1000,
      wage_lower_bound: rand(7..9)*1000,
             is_hidden: hide,
               user_id: 1,
           category_id: Category.all.sample.id,
           job_address: addresses.sample,
          company_name: "#{company}",
         company_image: nil
    )
  end
end
puts "created 5 Public and Hidden jobs for each company."
