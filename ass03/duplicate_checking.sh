#!/bin/bash

# 定义记录文件的路径
LOG_FILE="result"

# 定义区别行数的阈值
THRESHOLD=$1

# 删除旧的记录文件（如果存在）
rm -f "$LOG_FILE"

# 查找目标目录下的所有文件
files=$(find "$2" -type f)

# 遍历所有文件的组合，比较它们之间的区别

for file1 in $files; do
  for file2 in $files; do
    if [ "$file1" != "$file2" ]; then
      # 比较文件并统计区别行数
      diff_output=$(diff --brief "$file1" "$file2")
      diff_lines=$(echo "$diff_output" | wc -l)

      # 统计文件行数
      file1_lines=$(wc -l < "$file1")
      file2_lines=$(wc -l < "$file2")

      # 如果区别行数小于阈值，记录文件名
      if [ "$diff_lines" -lt "$THRESHOLD" ]; then
        echo "$file1 $file2 $diff_lines $file1_lines $file2_lines" >> "$LOG_FILE"
      fi
    fi
  done
done

# 输出结果
echo "以下是区别行数小于 $THRESHOLD 的文件对："
echo "文件1  文件2  区别行数  文件1总行数 文件2总行数"
cat "$LOG_FILE"