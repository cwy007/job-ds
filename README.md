# README

第一周的进度：admin部分实作
1.先做jobs部分
  至少要有两个栏位：title:string description:text
  限制：标题（title）不得为空


2.在做admin::jobs的CRUD
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
  
