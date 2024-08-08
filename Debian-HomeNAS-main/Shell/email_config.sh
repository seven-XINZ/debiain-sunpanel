#!/bin/bash

# 插入内容到 /etc/exim4/update-exim4.conf.conf 文件中
cat <<EOF > /etc/exim4/update-exim4.conf.conf
dc_eximconfig_configtype='satellite'
dc_other_hostnames=''
dc_local_interfaces='127.0.0.1 ; ::1'
dc_readhost='qq.com'
dc_relay_domains=''
dc_minimaldns='false'
dc_relay_nets=''
dc_smarthost='smtp.qq.com:587'
CFILEMODE='644'
dc_use_split_config='false'
dc_hide_mailname='true'
dc_mailname_in_oh='true'
dc_localdelivery='mail_spool'
EOF

# 询问用户输入QQ邮件账户及授权密码
read -p "请输入QQ邮箱账户: " qq_account
read -sp "请输入QQ邮箱账户授权密码: " qq_password
echo

# 编辑 /etc/exim4/passwd.client 文件配置邮件发送账户
cat <<EOF > /etc/exim4/passwd.client
qq-smtp.l.qq.com:$qq_account:$qq_password
*.qq.com:$qq_account:$qq_password
smtp.qq.com:$qq_account:$qq_password
EOF

# 编辑 /etc/email-addresses 文件，添加邮箱地址
echo "root: $qq_account" > /etc/email-addresses

# 重启exim4服务
service exim4 restart

# 检测exim4服务是否正常运行
if service exim4 status | grep -q "active (running)"; then
    echo -e "\e[32m邮件发送服务已配置完成。\e[0m"
else
    echo -e "\e[31m邮件发送服务运行异常，请检查服务状态。\e[0m"
fi

# 提醒用户如果安装了防火墙，记得开放587端口
echo "如有安装防火墙，请确保开放587端口。"
