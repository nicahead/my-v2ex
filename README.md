# my-v2ex
maven多模块构建的仿v2ex论坛

### 技术栈
`Spring`  `Spring MVC`  `Mybatis`  `Jquery`  `Bootstrap` `Mysql` `Ajax`  `Maven`  `Maven`  `httpClient`  `RESTful` `jersey` `响应式`

### 已有功能
###### 前台：
 - 登录、注册
 - 发表帖子
 - 评论帖子
 - 帖子列表及评论列表分页显示
 - 评论@圈人
 - 上传头像，帖子插入本地图片，支持拖拽上传
 - 显示热帖排行榜


###### 后台：
 - 登录，仅限管理员
 - 添加管理员，或将普通用户修改为管理员
 - 添加、删除、修改用户信息，上传头像，分页显示用户列表
 - 添加、删除、修改类别节点信息

 ### 待完善功能
 - 用户通知，查看别人对自己的回复
 - 通过电子邮件找回密码
 - 后台帖子列表
 - 后台评论列表
 - 表单信息的服务端验证

### 预览
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214175730544.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214175919400.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019021418022349.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214180411232.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214180604316.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214180711868.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190214180924388.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM0ODM4NjQz,size_16,color_FFFFFF,t_70)

### 使用
- 将项目down到本地，解压项目
- 使用idea import project，一路next
- 安装项目依赖
- 分别运行img、admin、api、ui模块，注意每个模块是分开运行的，所以需要设置各自的端口号，比如我设置的是img(http port8080,jmx port 1099)，api-(http port8081,jmx port 1100)，ui-(http port8082,jmx port 1101)，admin-(http port8084,jmx port 1103)，jmx port 本菜鸡不知道有木有影响。
