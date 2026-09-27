# Linear Algebra Done Wrong 中译版

对应作者 **2026-08-31** 版本，[网址](https://sites.google.com/a/brown.edu/sergei-treil-homepage/linear-algebra-done-wrong)。

读者亦可关注[南京大学董耀择同学翻译的版本](https://github.com/DongYaoZe/Translate-LADW)。

采用 [zhbook 中文书籍 LaTeX 模板](https://github.com/andy123t/zhbook)。

### 编译 TeX 源文件
转到克隆的目标文件夹。然后在命令行中键入

```bash
xelatex -synctex=1 -interaction=nonstopmode -file-line-error ladwcn
zhmakeindex -s zh.ist ladwcn.idx
xelatex -synctex=1 -interaction=nonstopmode -file-line-error ladwcn
xelatex -synctex=1 -interaction=nonstopmode -file-line-error ladwcn
```
稍作等待，即可看到编译出的 ladwcn.pdf。

要清理多余的中间文件，请在命令行中键入 

```bash
# Windows
del *.aux *.bcf *.idx *.ind *.ilg *.run.xml *.toc *.log *.synctex
# Linux
rm *.aux *.bcf *.idx *.ind *.ilg *.run.xml *.toc *.log *.synctex
```

若未安装 zhmakeindex，则只需执行

```bash
xelatex -synctex=1 -interaction=nonstopmode -file-line-error ladwcn
xelatex -synctex=1 -interaction=nonstopmode -file-line-error ladwcn
```