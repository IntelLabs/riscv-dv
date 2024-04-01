#!/bin/bash

# 设置spike可执行文件的路径
SPIKE_PATH="/tmpdata/project/riscv/sunjiawen/illegal_spike/riscv-isa-sim/build"

# 设置源ELF文件的目录
# SRC_DIR="vector_unit_test_elf_vstart0_hundred_percent_2024-01-20_1"
# SRC_DIR="vector_unit_test_elf_mu_tu_vstart0_hundred_percent_2024-01-18_1_check"

# 设置输出LOG文件的目录
# LOG_DIR="elf_to_log_2024-01-20_2"
# LOG_DIR="elf_to_log_2024-01-18_1_check"

# 初始化变量
SRC_DIR=""
LOG_DIR=""

# 使用getopts解析命令行参数
while getopts "e:f:" opt; do
  case $opt in
    e) SRC_DIR=$OPTARG ;;
    f) LOG_DIR=$OPTARG ;;
    \?) echo "Usage: cmd [-e] input_folder [-f] output_folder" ;;
  esac
done

# 检查是否提供了必要的参数
if [ -z "$SRC_DIR" ] || [ -z "$LOG_DIR" ]; then
  echo "Both input and output folders must be specified."
  echo "Usage: $0 [-e] input_folder [-f] output_folder"
  exit 1
fi

# 打印输入输出目录以确认
echo "Input folder: $SRC_DIR"
echo "Output folder: $LOG_DIR"


# 创建LOG文件目录（如果不存在）
mkdir -p "$LOG_DIR"

# 遍历文件夹中的所有ELF文件
for elf_file in "$SRC_DIR"/*.elf; do
    # 获取不带路径的文件名
    filename=$(basename -- "$elf_file")
    # 构建LOG文件名
    log_file="$LOG_DIR/${filename%.elf}.log"
    # 执行timeout命令，并将输出重定向到LOG文件
    # timeout --foreground 5s stdbuf -oL -eL $SPIKE_PATH/spike --log-commits --isa RV64GCV -l "$elf_file" >"$log_file" 2>&1 
    # $SPIKE_PATH/spike --isa=rv64gcv --varch=vlen:256,elen:64 -l --log-commits "$elf_file" >"$log_file" 2>&1  
    $SPIKE_PATH/spike -m16384 --isa=rv64gcv --varch=vlen:128,elen:64 -l --log-commits "$elf_file" >"$log_file" 2>&1  
		echo "已转换为LOG文件。"
done

echo "所有的ELF文件都已转换为LOG文件。"

