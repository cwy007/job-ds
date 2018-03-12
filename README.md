# JobsInChina
online demo:
https://jobsinchina.herokuapp.com/

# About your application's environment

```
cwy@MPro ⮀ ~/shanghai/job-ds ⮀ ⭠ started± ⮀ rails about
About your application's environment
Rails version             5.0.2
Ruby version              2.4.2-p198 (x86_64-darwin17)
RubyGems version          2.7.3
Rack version              2.0.1
JavaScript Runtime        Node.js (V8)
...
Environment               development
Database adapter          sqlite3
Database schema version   20170504063011
```

# Get Started
```
git clone git@github.com:cwy007/job-ds.git
cd job-ds
cp config/database.yml.example config/database.yml
bundle install
rake db:migrate
rake db:seed
rails s
```

http://localhost:3000

# 第一周的进度：admin部分实作
1.先做jobs部分
```
  至少要有两个栏位：title:string description:text
  限制：标题（title）不得为空
```

2.在做admin::jobs的CRUD
```
  加一个admin panel的连接在导航栏的dropdown里
  访问admin页面必须先登录
  实作require_is_admin
    重构到job model中
    新增栏位is_admin到jobs中
    用is_admin替换admin？中的条件
  admin页面要能看到job_status （public/hidden)
  一般用户只能看到公开的@jobs = Job.where(:is_hidden => false)
  实作hide/publish按钮
  讲job_status用图片表示 gem ‘font-awesome-rails’
  增加栏位到jobs（wage_lower_bound, wage_upper_bound, contact_email)
    限制：wage不得为空，最低工资大于0；
```

3.优化index view页面
```
  区分admin页面，加个sidebar
   user可以在首页
     按照工资下限排序
     按照工资上限排序
     按照发表时间排序
  user可以上传简历
  admin页面可以查看每个job中的简历
```
