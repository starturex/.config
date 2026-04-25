# # 1 - 静止的方块光标（默认）
# echo -ne '\e[1 q'
# # 2 - 闪烁的方块光标
# echo -ne '\e[2 q'
# # 3 - 静止的下划线光标
# echo -ne '\e[3 q'
# # 4 - 闪烁的下划线光标
# echo -ne '\e[4 q'
# # 5 - 闪烁的竖线光标（你的命令）
# echo -ne '\e[5 q'
# # 6 - 静止的竖线光标
# echo -ne '\e[6 q'
# # 重置为默认光标（部分终端生效）
# echo -ne '\e[0 q'

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}

# 避免重复添加函数到 precmd_functions（防止多次 source 时重复）
if [[ ! " ${precmd_functions[@]} " =~ " _fix_cursor " ]]; then
    precmd_functions+=(_fix_cursor)
fi