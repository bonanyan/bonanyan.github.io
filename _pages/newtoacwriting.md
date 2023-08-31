---
layout: page
permalink: /newtoacwriting/
title: 学术写作新手入门必备知识
description: 燕博南
nav: false
nav_order: 3
---

### 写作格式篇
- 遇到任何不知道用什么格式的（比如Fig.1还是Figure 1），上目标刊物/会议官网读author guideline
- 不许用全角
- 括号、逗号前要有空格
  - I am good (if so),
- 每句话只能有一个主语：中文里可以复合句双主语“你是A，他是B”，但是英文不行
  - I am good, and he is better. (*错*)
  - I am good. He is better. (*对*)
- 不许用缩写
  - can't (*错*) -> cannot
  - don't (*错*) ->  do not/does not
  - isn't/aren't -> is/are not
- 一般不用第一人称I，需要的话用we说事
- 图中分块描述，一般都用(a) (b) (c)
- 尽量少用被动语态，除非前后“连贯需求”需要把旧信息放前面
- proof-reading: 提交前一定要*全文*逐词读一下，假装自己啥也不懂，你看后面用到的概念在前文中有没有解释过

### Latex篇
- Latex的引号不是双引号，而是\`\`XX\'\'
- Latex回车是空格
- Latex里~是不换行空格，比如7~nm，中间有空格但是排版后这两个永远在一起
- Latex里多用ref，比如Fig.~\\\ref{fig:bg}而不是Fig. 2
- references：.bib里的需要永远大写的SRAM CMOS这种需要用大括号框起来保持原样
- 先去要投的官网去找一下Template，常用的：
  - IEEE:  https://template-selector.ieee.org
  - ACM: https://www.acm.org/publications/proceedings-template
  - Neurips: https://neurips.cc/Conferences/2023/PaperInformation/StyleFiles
  - Nature Portfoio: https://www.springernature.com/gp/authors/campaigns/latex-author-support

### 写作内容篇
- 摆正论文写作观观念：写论文是在marketing your idea，不是写实验报告
  - marketing your idea：主要写idea是什么，怎么定量验证可行(优势)的，重点写我这个idea有多厉害
  - 实验报告：罗列做过的事情【其实读者根本不关心】：我做了实验一，过程是XX，结果是XX；我做了实验二，过程是XX，结果是XX
- introduction部分一般包括：
  - 大背景(领域主要问题/主要应用/研究热情)->
  - 自身技术赛道优势->
  - 关键问题/挑战【一定是本文要解决的，与本文无关的不要写】
  - (optional) 已有工作总结
  - 为了解决关键问题/补充已有工作的不足，本文干了点啥(3~5句话总结)
  - 本文的contribution (跟个列表，需要对应关键问题解决)
  - 本文idea验证方式和效果(*相比于GPU效率提高了100倍*)
- Preliminaries部分每一个子部分最后一定要加上背景知识的不足
- 不要矮化已有工作，一定要先写出其优点再说其短板；再背后的逻辑应该是“已有工作很强，但本文更强”
- 设计文章outline的时候，每一个创新点都要它自己的：
  - 必要性：优势或者能解决什么问题
  - 设计是什么：具体说明怎么实现，具体到一个不知道你之前工作的读者可以根据文章复现
  - 优势的定量评估：文章eval的部分至少要有一个说明自身Performance, Power, Area (PPA)的数据（以及这些数据的experiment setup要提前说明）；至少要对比现有工作，本工作的创新设计/算法是在功能上多了，还是实现同一功能的PPA更好了？
- 文章outline先捋思路主要回答以下问题：
  - 文章的创新点具体是什么
  - 对应解决什么问题
  - 为什么说是“新”型解决思路 (创新点是什么)
  - 各部分之间的关系是什么
- 文章长度：写满要求的（例如，要求 <6 页，就写满6页，少了显得没内容、多了直接拒）
- 文章长度分配: IEEE/ACM 4页：
	
| Content                                   | How many pages | Cumulative pages |
| ----------------------------------------- | -------------- | ---------------- |
| intro+prelim(if any)                      | 1              | 1                |
| method                                    | 1.5            | 2.5              |
| result/evaluation                         | 1              | 3.5              |
| conclusion & acknowledgement & references | 0.5            | 4                | 

- IEEE/ACM 6页

| Content                                   | How many pages | Cumulative pages |
| ----------------------------------------- | -------------- | ---------------- |
| intro                                     | 1              | 1                |
| preliminaries                             | 0.5~0.75       | 1.5~1.75         |
| method                                    | 2.25~2.5       | 4                |
| result/evaluation                         | 1.25~1.5       | 5.25~5.5         |
| conclusion & acknowledgement & references | 0.5~0.75       | 6                |

- IEEE/ACM 8页


| Content                                   | How many pages | Cumulative pages |
| ----------------------------------------- | -------------- | ---------------- |
| intro                                     | 1～1.25        | 1～1.25           |
| preliminaries                             | 0.75～1.25     | 2~2.25           |
| method                                    | 3～3.5         | 5～5.5           |
| result/evaluation                         | 2～2.5         | 7~7.25           |
| conclusion & acknowledgement & references | 0.5~0.75       | 8                |

_或者method与evaluation长度互换，看内容灵活调整_

- Nature子刊:
  - Main text – up to **3,500** words, excluding abstract, Methods, references and figure legends.
  - Abstract – up to **150** words, unreferenced. 
  - Display items – up to **6** items (figures and/or tables). 
  - Article should be divided as follows:  
     - Introduction (without heading) 
     - Results
     - Discussion
     - Methods. ​

| Content      | How many words |
| ------------ | -------------- |
| Introduction | 500            | 
| Result 1     | 1000           |
| Result 2     | 1000           |
| Result 3     | 1000           |

- Nature正刊
	- In print, physical sciences papers do not normally exceed **6 pages** on average and biological sciences papers do not normally exceed **8 pages** on average.
	- The typical length of a 6-page article with 4 modest display items (figures and tables) is 2500 words (summary paragraph plus body text). The typical length of an 8-page article with 5-6 modest display items is 4300 words. A ‘modest’ display item is one that, with its legend, occupies about a quarter of a page (equivalent to ~270 words).
	- <50 References