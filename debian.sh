#!/bin/bash

# 常量定义
DEBIAN_HOMENAS_DIR="debian"
URL_PREFIX="https://github.com/seven-XINZ/debiain-sunpanel/blob/main/debian/Shell/"
COLOR_RED="31"
COLOR_GREEN="32"
COLOR_BLUE="34"

# 脚本文件列表
SCRIPT_URLS=(
    "system_init.sh"                # 0  系统初始配置
    "install_docker.sh"             # 1  安装Docker
    "dockerhub_mirror.sh"           # 2  添加镜像地址
    "deploy-containers.sh"          # 3  安装容器应用
)

# 创建目录
[[ ! -d "$DEBIAN_HOMENAS_DIR" ]] && mkdir -p "$DEBIAN_HOMENAS_DIR"

# 函数：打印带颜色的输出
color_print() {
    local color="$1"
    shift
    echo -e "\033[${color}m$*\033[0m"
}

# 函数：下载并执行脚本
execute_script() {
    local index="$1"
    local alias="$2"
    wget -q --show-progress -O "${DEBIAN_HOMENAS_DIR}/${SCRIPT_URLS[$index]}" "${URL_PREFIX}${SCRIPT_URLS[$index]}" || {
        color_print $COLOR_RED "下载 ${SCRIPT_URLS[$index]} 失败，请检查网络连接或稍后再试。"
        return 1
    }
    color_print $COLOR_BLUE "=================================================="
    color_print $COLOR_BLUE "正在执行 ${alias}..."
    color_print $COLOR_BLUE "=================================================="
    if bash "${DEBIAN_HOMENAS_DIR}/${SCRIPT_URLS[$index]}"; then
        color_print $COLOR_GREEN "${alias} 执行完成。"
    else
        color_print $COLOR_RED "${alias} 执行失败。"
    fi
}

# 函数：显示菜单
show_menu() {
    color_print $COLOR_BLUE "=================================================="
    echo -e "$1"
    color_print $COLOR_BLUE "=================================================="
    echo -n -e "\033[${COLOR_BLUE}m请输入选择：\033[0m"
}

# 函数：显示欢迎信息
show_welcome() {
    color_print $COLOR_BLUE "=================================================="
    echo -e "                 Debian xinz-sun-panel\n\n                                  QQ群：339169752\n作者：xinz\n项目：https://github.com/seven-XINZ/debiain-sunpanel"
}

# 函数：主菜单处理
handle_main_menu() {
    clear
    while true; do
        show_welcome
        show_menu "$main_menu"
        read -r choice
        case "$choice" in
            1)
                execute_script 0 "系统初始配置"  # 执行系统初始化
                ;;
            2)
                execute_script 1 "安装Docker"  # 执行安装Docker
                ;;
            3)
                execute_script 2 "添加镜像地址"  # 执行添加镜像地址
                ;;
            4)
                execute_script 3 "安装容器应用"  # 执行安装容器应用
                ;;
            0)
                color_print $COLOR_BLUE "退出脚本。"
                exit 0
                ;;
            *)
                color_print $COLOR_RED "\n无效选择：$choice。请重新输入。\n"
                ;;
        esac
    done
}

# 主菜单定义
main_menu=$(cat <<-EOF
1、系统初始配置
2、安装Docker
3、添加镜像地址
4、安装容器应用
0、退出脚本
EOF
)

# 启动脚本并显示欢迎信息
handle_main_menu
