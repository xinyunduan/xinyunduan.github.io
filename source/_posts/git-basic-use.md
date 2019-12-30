---
title: git基本操作
date: 2019-12-26 22:47:18
tags: 
   - git
categories: 
   - [git, 工具]
---
## 1.初始化本地项目
    1.现在本地新建一个文档，比如：D:\gitproject
    2.进入D:\gitproject目录下，右键选择git bash进入git命令模式
    3.git init初始化一个git项目

## 2.从远端仓库克隆一个项目到本地
   从远端仓库克隆项目到本地，如D:\gitproject\目录下，命令：
   ```
   git clone github地址
   ```
<!-- more --> 
## 3.绑定远程仓库：
```
git remote add origin github地址
```
## 4.新建分支并进入分支进行操作
```
git branch 分支名
git checkout 分支名
```
也可以直接用:
```
git checkout -b 分支名
```

## 5.创建本地分支与远端分支的关联
要创建本地的哪个分支与远端分支关联，切换到哪个分支
比如创建本地xinyun分支与远端xinyun分支关联
- 首先 git checkout xinyun
- 然后 git branch --set-upstream-to=origin/remote_branch  your_branch

## 6.创建关联之后的开发中每次更新
首先将远端的仓库pull到本地，有修改之后再push到远端去
比如我要先将远端master pull到本地master，再合并master到本地xinyun
进行了修改操作之后再将xinyun分支push到远端xinyun分支
```
git checkout master
git pull origin master
git merge xinyun
git branch checkout xinyun
```

## 7.更新
一系列更新，比如新增或者修改了文件readme.txt
- 需要先添加：git add readme.txt
- 再提交：git commit -m "新增或者修改了文件readme.txt"
- 最后push：git push origin xinyun:xinyun
- 或者使用git add -u来添加修改的文件或删除的文件到缓存区

**扩展：**
git add -u：将文件的修改、文件的删除，添加到暂存区。
git add .：将文件的修改，文件的新建，添加到暂存区。
git add -A：将文件的修改，文件的删除，文件的新建，添加到暂存区。

## 8.如果本地分支与远端分支进行了关联
pull和push操作可以简化
git pull
git push

## 9.删除远程分支
   git push origin --delete <remote-branchname>
   或者
   git push origin :<remote-branchname>
## 10.删除本地分支
切换到其他分支
git branch -D branch-name(to be deleted)

## 11.重命名本地分支
   git branch -m <new-branch-name>

## 12.拉取远程分支
- git checkout -b 本地branch-name origin/远端branch-name
- git pull origin 远端branch-name

## 13.克隆远端项目指定分支
git clone -b <远程指定分支> <远程仓库地址> <本地文件夹名>
如果不指定本地文件夹，则默认克隆到当前目录下。
## 14.查看与本地仓库关联的远端仓库
git remote --v
## 15.换行符问题,统一linux风格
```
#提交/检出 不转换
git config --global core.autocrlf false
 
#拒绝提交包含混合换行符的文件
git config --global core.safecrlf true
 
#设置区分大小写
git config --global core.ignorecase false
```
## 16.新手使用git协同开发需注意
每次更新代码之前，先pull远端的仓库代码，之后再在本地更新代码。