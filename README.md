![debian-homenas02](https://github.com/user-attachments/assets/7fa0122d-f985-4953-b62f-3866c698600d)

这是根据《基于Debian搭建HomeNAS》教程所写的半自动化配置脚本。
#### [搭建HomeNAS系列教程索引(点我打开)](https://docs.qq.com/doc/p/fa51c8a8545b12a5432df0efa9818d2939860ed0)
#### [脚本介绍(点我打开)](https://github.com/kekylin/Debian-HomeNAS/blob/main/%E8%84%9A%E6%9C%AC%E4%BB%8B%E7%BB%8D.md)
#### [成果展示(点我打开)](https://github.com/kekylin/Debian-HomeNAS/blob/main/%E6%88%90%E6%9E%9C%E5%B1%95%E7%A4%BA.md)
---
# 使用方法
### 1、首先使用SSH连接系统，然后用安装系统时创建的第一个普通用户账号进行登录。登陆后，使用以下命令切换到root账户。请注意，Debian系统默认禁用root账户直接通过SSH连接。
  ```shell
su -
  ```
### 2、执行脚本下载命令并自动运行

Github直连
  ```shell
wget -O debian.sh -q --show-progress https://raw.githubusercontent.com/seven-XINZ/debiain-sunpanel/main/debian.sh && bash debian.sh

  ```
### 3、登陆使用
> **脚本执行完毕后**

sun-panel,一个精美的、易于使用的、导航页面管理器。自带中文，日常维护时，不管是部署、更新还是维护，都比较方便，但目前不是特别完善，推荐搭配图标库以及1panel面板使用。
  ```shell
http://localhost:3000
  ```

# 转载请保留出处
- DIY NAS_3群 339169752
