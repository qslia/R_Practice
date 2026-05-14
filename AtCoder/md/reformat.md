在 VS Code 中把 `.R` 文件的 Tab 宽度设为 8，可以在设置里直接指定语言。有两种方式可以做到：

### 方式一：通过设置界面（推荐）
1. 打开 VS Code。
2. 按下 `Ctrl + Shift + P` (Mac: `Cmd + Shift + P`)，输入 `Preferences: Open User Settings (JSON)` 并打开。
3. 在 `settings.json` 文件中，加入以下代码：
```json
"[r]": {
    "editor.detectIndentation": false, // 关闭自动检测缩进，确保设置不被文件内容覆盖 
    "editor.tabSize": 8,
    "editor.insertSpaces": false // 设为 false 表示按 Tab 插入的是 Tab 字符，而非空格，符合 R 语言惯例 
}
```

### 方式二：通过命令面板
1. 打开一个 `.R` 文件。
2. 按下 `Ctrl + Shift + P` (Mac: `Cmd + Shift + P`)。
3. 输入并选择 `Preferences: Configure Language Specific Settings...`。
4. 在弹出的语言列表中选择 `R`。
5. 这将打开 `settings.json`，并将光标定位到 `"[r]"` 部分，你只需在其中添加 `"editor.tabSize": 8` 等配置即可。

这样配置后，你每次打开 `.R` 文件，VS Code 就会自动使用 Tab 宽度 8 的设置了。
---
要把现有的 `.R` 文件重新格式化为 **Tab 宽度 = 8**，在 VS Code 里可以这样做：

## 方法一：使用格式化命令（最简单）

1. 打开你的 `.R` 文件
2. 按下 `Shift + Alt + F`（Mac: `Shift + Option + F`）
3. 如果之前已经配置好了 `editor.tabSize = 8`，VS Code 会自动使用这个设置来重新格式化

## 方法二：如果没有自动格式化生效

如果格式化后 Tab 宽度还是不对，可能是因为：

1. **检查是否安装了 R 格式化工具**：VS Code 对 R 语言的格式化通常需要 `languageserver` 或 `formatR` 包
   ```r
   # 在 R 控制台中安装
   install.packages("languageserver")
   install.packages("formatR")
   ```

2. **手动触发重新缩进**：
   - 选中全部代码：`Ctrl + A`（Mac: `Cmd + A`）
   - 然后按 `Ctrl + ]` 或 `Ctrl + [` 调整缩进
   - 或者使用命令：`Ctrl + Shift + P` → 输入 `Reindent Lines` 并执行

## 方法三：批量处理多个 .R 文件

如果有多个 `.R` 文件需要重新格式化：

```r
# 在 R 控制台中运行
library(formatR)
# 处理单个文件
tidy_source("你的文件.R", indent = 8, output = "新文件.R")
# 或批量处理目录中的文件
files <- list.files("你的目录", pattern = "\\.R$", full.names = TRUE)
for (f in files) {
  tidy_source(f, indent = 8, output = f, backup = TRUE)
}
```

## 方法四：VS Code 批量格式化（需要扩展支持）

1. 安装 **R** 扩展（由 REditorSupport 提供）
2. 打开命令面板：`Ctrl + Shift + P`
3. 输入 `Format Document With...` → 选择 R 格式化器
4. 如果需要批量处理多个文件，可以：
   - 在工作区右键 → `Format All Files`（部分扩展支持）

**注意**：重新格式化前建议先备份文件，或者使用 Git 提交当前状态，以防格式化的结果不符合预期。