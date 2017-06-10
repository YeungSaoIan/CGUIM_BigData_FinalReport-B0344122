台灣旅遊與僑生來台就學
================

組員姓名
--------

資管二甲 B0344122 楊守仁

分析議題背景
------------

從網路上的open data收集了歷年來台旅客的國藉及現時台灣各大專院校外藉學生等資料從而了解台灣的風光和旅遊，有沒有帶起外國人對台灣的興趣並且來台就/升學。

分析動機
--------

作為外國長大的僑生的一分子，藉著這個機會了解「同是天涯淪落人」的留台外國人的在台灣甚至在長庚的狀況。

使用資料
--------

File\_1940是各級學校僑生資料 visitorstatictis1是自1956年以來來台旅客人數及國藉資料 Student\_RPT\_05是現時台灣各大專院校外藉學生資料包括人數國藉科系學制等資料

\*還有一份是"大專校院僑生及畢業生人數—按性別、校別與僑居地別分"資料，但資料尚有一些問題，所以尚未載入，但是連同作業一同commit

載入使用資料們

``` r
#這是R Code Chunk
library(readr)
File_1940 <- read_csv("~/CGUIM_BigData_FinalReport-B0344122/File_1940.csv", skip = 3)
```

    ## Warning: Missing column names filled in: 'X1' [1], 'X2' [2]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_character(),
    ##   X2 = col_character(),
    ##   計 = col_character(),
    ##   `公私立
    ## 大　學` = col_character(),
    ##   `國防
    ## 醫學院` = col_character(),
    ##   `僑　生
    ## 先修部` = col_character(),
    ##   `專科
    ## 學校` = col_character(),
    ##   高國中 = col_character(),
    ##   `職業
    ## 學校` = col_character(),
    ##   國小 = col_integer(),
    ##   `各級
    ## 補校` = col_character(),
    ##   海青班 = col_integer()
    ## )

    ## Warning: 1 parsing failure.
    ## row col   expected    actual                                                 file
    ##   1  -- 12 columns 9 columns '~/CGUIM_BigData_FinalReport-B0344122/File_1940.csv'

``` r
visitorstatictis1 <- read_csv("~/CGUIM_BigData_FinalReport-B0344122/visitorstatictis1.csv")
```

    ## Warning: Missing column names filled in: 'X2' [2], 'X3' [3], 'X4' [4],
    ## 'X5' [5], 'X6' [6], 'X7' [7], 'X8' [8], 'X9' [9], 'X10' [10]

    ## Parsed with column specification:
    ## cols(
    ##   `Visitor  Arrivals, 1956-2015` = col_character(),
    ##   X2 = col_character(),
    ##   X3 = col_character(),
    ##   X4 = col_character(),
    ##   X5 = col_character(),
    ##   X6 = col_character(),
    ##   X7 = col_character(),
    ##   X8 = col_character(),
    ##   X9 = col_character(),
    ##   X10 = col_character()
    ## )

``` r
Student_RPT_05 <- read_csv("~/CGUIM_BigData_FinalReport-B0344122/Student_RPT_05.csv")
```

    ## Warning: Missing column names filled in: 'X1' [1], 'X3' [3], 'X4' [4],
    ## 'X5' [5], 'X6' [6], 'X7' [7], 'X8' [8], 'X9' [9]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_character(),
    ##   `05.僑生、港澳生數` = col_character(),
    ##   X3 = col_character(),
    ##   X4 = col_character(),
    ##   X5 = col_character(),
    ##   X6 = col_character(),
    ##   X7 = col_character(),
    ##   X8 = col_character(),
    ##   X9 = col_character(),
    ##   `僑生總計：` = col_character(),
    ##   `43833` = col_character(),
    ##   `僑生男：` = col_character(),
    ##   `21806` = col_character(),
    ##   `僑生女：` = col_character(),
    ##   `22027` = col_character()
    ## )

``` r
X104oversea_B1_1a <- read_csv("~/CGUIM_BigData_FinalReport-B0344122/104oversea_B1-1a.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   學校代碼 = col_character(),
    ##   `學校名稱` = col_character(),
    ##   等級 = col_character(),
    ##   僑居地 = col_character(),
    ##   在學學生人數_男 = col_integer(),
    ##   在學學生人數_女 = col_integer(),
    ##   新生 = col_integer(),
    ##   舊生 = col_integer(),
    ##   上學年度畢業生人數_男 = col_integer(),
    ##   上學年度畢業生人數_女 = col_integer()
    ## )

資料處理與清洗
--------------

``` r
#資料清洗
#File_1940清洗
names(File_1940)[1] <-"學年度"
names(File_1940)[2] <-"總計"
names(File_1940)[3] <-"計"
names(File_1940)[4] <-"公私立大學"
File_1940 <- File_1940[-1,]

#visitorstatictis1清洗
visitorstatictis1 <- visitorstatictis1[-1,]
visitorstatictis1 <- visitorstatictis1[-1,]
names(visitorstatictis1)[1] <-"year"
names(visitorstatictis1)[2] <-"總計人數"
names(visitorstatictis1)[3] <-"成長率"
names(visitorstatictis1)[4] <-"指數"
names(visitorstatictis1)[5] <-"外籍旅客人數"
names(visitorstatictis1)[6] <-"外籍旅客成長率"
names(visitorstatictis1)[7] <-"外籍旅客指數"
names(visitorstatictis1)[8] <-"華僑旅客人數"
names(visitorstatictis1)[9] <-"華僑旅客成長率"
names(visitorstatictis1)[10] <-"華僑旅客指數"

#Student_RPT_05清洗
Student_RPT_05$X1 <- NULL
Student_RPT_05 <- Student_RPT_05[-1,]
Student_RPT_05 <- Student_RPT_05[-1,]
Student_RPT_05 <- Student_RPT_05[-1,]
names(Student_RPT_05)[1] <-"學年度"
names(Student_RPT_05)[2] <-"設立別"
names(Student_RPT_05)[3] <-"學校類別"
names(Student_RPT_05)[4] <-"學校代碼"
names(Student_RPT_05)[5] <-"學校名稱"
names(Student_RPT_05)[6] <-"系所代碼"
names(Student_RPT_05)[7] <-"系所名稱"
names(Student_RPT_05)[8] <-"學制"
names(Student_RPT_05)[9] <-"僑生總計"
names(Student_RPT_05)[10] <-"僑生男"
names(Student_RPT_05)[11] <-"僑生女"
names(Student_RPT_05)[12] <-"港澳生總計"
names(Student_RPT_05)[13] <-"港澳生男"
names(Student_RPT_05)[14] <-"港澳生女"

#X104oversea_B1_1a清洗
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("馬來西亞")] <- "3.137956"
```

    ## Warning: Unknown or uninitialised column: 'locationy'.

``` r
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("馬來西亞")] <- "101.687132"
```

    ## Warning: Unknown or uninitialised column: 'locationx'.

``` r
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("南非")] <- "-30.909670"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("南非")] <- "24.259127"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("加拿大")] <- "59.997026"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("加拿大")] <- "-112.402012"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("緬甸")] <- "21.415178"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("緬甸")] <- "96.396717"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("印尼")] <- "-4.381767"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("印尼")] <- "122.293216"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("日本")] <- "36.552849"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("日本")] <- "138.307262"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("菲律賓")] <- "14.598987"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("菲律賓")] <- "120.983238"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("新加坡")] <- "1.360033"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("新加坡")] <- "103.868979"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("泰國")] <- "13.748660"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("泰國")] <- "100.492952"
    
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("英國")] <- "54.938086"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("英國")] <- "-2.867684"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("美國")] <- "39.739020"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("美國")] <- "-101.620433"
    
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("阿根廷")] <- "-35.388441"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("阿根廷")] <- "-65.392241"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("南韓")] <- "37.592579"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("南韓")] <- "126.975279"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("紐西蘭")] <- "-41.299974"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("紐西蘭")] <- "174.776852"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("墨西哥")] <- "24.129376"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("墨西哥")] <- "-102.917429"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴西")] <- "-8.884431"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴西")] <- "-55.488347"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴拉圭")] <- "-23.269402"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴拉圭")] <- "-58.462776"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("越南")] <- "14.484540"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("越南")] <- "108.360975"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("肯亞")] <- "0.418065"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("肯亞")] <- "37.868307"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("西班牙")] <- "39.690189"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("西班牙")] <- "-3.132226"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("尼加拉瓜")] <- "12.891754"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("尼加拉瓜")] <- "-85.188938"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴拿馬")] <- "8.484368"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴拿馬")] <- "-80.109248"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("澳大利亞")] <- "-24.551857"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("澳大利亞")] <- "134.182865"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("貝里斯")] <- "16.77919"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("貝里斯")] <- "-88.737792"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("智利")] <- "-26.554819"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("智利")] <- "-70.418818"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("薩爾瓦多")] <- "13.784449"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("薩爾瓦多")] <- "-89.230311"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("哥斯大黎加")] <- "9.948630"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("哥斯大黎加")] <- "-84.117774"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("法國")] <- "46.410759"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("法國")] <- "2.716875"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("阿拉伯聯合大公國")] <- "23.681736"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("阿拉伯聯合大公國")] <- "54.002147"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("葉門")] <- "15.846800"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("葉門")] <- "47.850653"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("俄羅斯")] <- "62.240122"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("俄羅斯")] <- "93.834839"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("斐濟")] <- "-17.847725"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("斐濟")] <- "178.013273"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("厄瓜多")] <- "-1.418160"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("厄瓜多")] <- "-78.294611"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("埃及")] <- "26.528769"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("埃及")] <- "29.858624"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴布亞紐幾內亞")] <- "-6.441940"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴布亞紐幾內亞")] <- "144.595518"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴基斯坦")] <- "30.082631"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴基斯坦")] <- "69.294945"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("巴林")] <- "26.038782"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("巴林")] <- "50.552011"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("比利時")] <- "50.906237"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("比利時")] <- "4.338898"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("玻利維亞")] <- "-16.597679"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("玻利維亞")] <- "-64.640097"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("帛琉")] <- "7.517417"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("帛琉")] <- "134.572796"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("德國")] <- "51.064427"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("德國")] <- "10.492793"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("多米尼克")] <- "15.430178"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("多米尼克")] <- "-61.360056"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("柬埔寨")] <- "12.678917"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("柬埔寨")] <- "104.855949"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("科威特")] <- "29.323762"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("科威特")] <- "47.414698"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("黎巴嫩")] <- "34.114424"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("黎巴嫩")] <- "35.884993"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("寮國")] <- "19.526376"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("寮國")] <- "102.532372"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("馬拉威")] <- "-14.020457"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("馬拉威")] <- "33.839299"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("孟加拉")] <- "23.739765"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("孟加拉")] <- "90.428802"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("模里西斯")] <- "-20.158133"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("模里西斯")] <- "57.503020"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("秘魯")] <- "-10.770646"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("秘魯")] <- "-76.089076"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("瑞典")] <- "64.496659"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("瑞典")] <- "17.217521"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("瑞士")] <- "46.783748"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("瑞士")] <- "7.925473"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("沙烏地阿拉伯")] <- "23.899594"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("沙烏地阿拉伯")] <- "45.433590"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("斯里蘭卡")] <- "7.588220"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("斯里蘭卡")] <- "80.696452"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("泰國")] <- "13.741785"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("泰國")] <- "100.499849"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("委內瑞拉")] <- "7.073115"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("委內瑞拉")] <- "-66.610604"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("汶萊")] <- "4.540462"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("汶萊")] <- "114.639758"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("象牙海岸")] <- "7.643046"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("象牙海岸")] <- "5.353685"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("匈牙利")] <- "47.012069"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("匈牙利")] <- "19.624482"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("義大利")] <- "42.935020"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("義大利")] <- "12.410020"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("印度")] <- "22.683064"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("印度")] <- "79.031203"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("約旦")] <- "31.279142"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("約旦")] <- "36.756995"
  
X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("史瓦濟蘭")] <- "-26.577159"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("史瓦濟蘭")] <- "31.451034"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("多明尼加")] <- "18.910874"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("多明尼加")] <- "-70.193544"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("納米比亞")] <- "-22.325959"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("納米比亞")] <- "16.942383"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("荷蘭")] <- "52.356997"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("荷蘭")] <- "4.894108"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("宏都拉斯")] <- "14.058685"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("宏都拉斯")] <- "-87.201599"

X104oversea_B1_1a$locationy[X104oversea_B1_1a$"僑居地" == c("瓜地馬拉")] <- "14.642601"
X104oversea_B1_1a$locationx[X104oversea_B1_1a$"僑居地" == c("瓜地馬拉")] <- "-90.498682"

X104oversea_B1_1a$studentcount <- as.numeric(X104oversea_B1_1a$"在學學生人數_男") + as.numeric(X104oversea_B1_1a$"在學學生人數_女")

#X104oversea_B1_1a清洗2
X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("菲律賓","汶萊","泰國","孟加拉","斯里蘭卡","沙烏地阿拉伯","馬來西亞","緬甸","印尼","日本","新加坡","南韓","越南","阿拉伯聯合大公國","寮國","柬埔寨","巴基斯坦","巴林","印度","黎巴嫩","約旦","葉門","科威特")] <- "亞洲"
```

    ## Warning: Unknown or uninitialised column: 'type'.

``` r
X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("美國","加拿大","墨西哥","古巴","多明尼加","多米尼克","薩爾瓦多","尼加拉瓜","瓜地馬拉","貝里斯","巴拿馬","哥斯大黎加")] <- "北美洲"

X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("厄瓜多","巴西","烏拉圭","巴拉圭","秘魯","智利","阿根廷","玻利維亞","哥倫比亞","委內瑞拉","宏都拉斯")] <- "南美洲"

X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("荷蘭","英國","西班牙","比利時","俄羅斯","德國","匈牙利","瑞典","法國","義大利","瑞士")] <- "歐洲"

X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("埃及","肯亞","南非","象牙海岸","納米比亞","馬拉威","馬拉威","模里西斯","史瓦濟蘭")] <- "非洲"

X104oversea_B1_1a$type[X104oversea_B1_1a$"僑居地" %in% c("澳大利亞","帛琉","斐濟","巴布亞紐幾內亞","紐西蘭","薩摩亞")] <- "大洋洲"

asiadata<-X104oversea_B1_1a[grepl("亞洲",X104oversea_B1_1a$"type"),]
eurodata<-X104oversea_B1_1a[grepl("歐洲",X104oversea_B1_1a$"type"),]
SAfricadata<-X104oversea_B1_1a[grepl("非洲",X104oversea_B1_1a$"type"),]
Oceaniadata<-X104oversea_B1_1a[grepl("大洋洲",X104oversea_B1_1a$"type"),]
NAdata<-X104oversea_B1_1a[grepl("北美洲",X104oversea_B1_1a$"type"),]
SAdata<-X104oversea_B1_1a[grepl("南美洲",X104oversea_B1_1a$"type"),]

#各級學校僑生現況
presentofoversea<-head(File_1940[order(File_1940$"學年度",decreasing = T),],10)

#國立大學僑生現況
presentofnational<-Student_RPT_05[grepl("公立",Student_RPT_05$"設立別"),]

#私立大學僑生現況
presentofprivate<-Student_RPT_05[grepl("私立",Student_RPT_05$"設立別"),]

#長庚大學僑生現況
test105<-Student_RPT_05[grepl("105",Student_RPT_05$"學年度"),]
testcgu<-test105[grepl("長庚大學",test105$"學校名稱"),]

knitr::kable(
  head(presentofoversea)
)
```

學年度 總計 計 公私立大學 國防 醫學院 僑　生 先修部 專科 學校 高國中 職業 學校 國小 各級 補校 海青班 ------- ------ ------ ----------- ------------ -------------- ---------- ------- ---------- ----- ---------- ------- 99 15525 14664 11951 75 1554 109 545 147 283 - 861 98 14788 14109 11228 72 1628 152 602 160 267 - 679 97 13223 12661 10047 74 1344 186 605 220 132 53 562 96 12556 12137 9450 75 1348 226 576 263 123 76 419 104 25944 24765 21802 88 990 58 642 779 400 6 1179 103 22685 21437 18741 81 1248 64 918 0 385 NA 1248

``` r
knitr::kable(
  head(presentofnational)
)
```

| 學年度 | 設立別 | 學校類別 | 學校代碼 | 學校名稱     | 系所代碼 | 系所名稱               | 學制         | 僑生總計 | 僑生男 | 僑生女 | 港澳生總計 | 港澳生男 | 港澳生女 |
|:-------|:-------|:---------|:---------|:-------------|:---------|:-----------------------|:-------------|:---------|:-------|:-------|:-----------|:---------|:---------|
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 140101   | 教育學系               | 學士班(日間) | 11       | 2      | 9      | 2          | 0        | 2        |
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 140101   | 教育學系               | 碩士班(日間) | 1        | 0      | 1      | 1          | 0        | 1        |
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 140101   | 教育學系               | 博士班       | 1        | 0      | 1      | 0          | 0        | 0        |
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 140203   | 華語文教學碩士學位學程 | 碩士班(日間) | 6        | 1      | 5      | 0          | 0        | 0        |
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 140401   | 幼兒教育研究所         | 碩士班(日間) | 0        | 0      | 0      | 2          | 0        | 2        |
| 101    | 公立   | 一般大學 | 0001     | 國立政治大學 | 220201   | 中國文學系             | 學士班(日間) | 8        | 2      | 6      | 11         | 5        | 6        |

``` r
knitr::kable(
  head(presentofprivate)
)
```

| 學年度 | 設立別 | 學校類別 | 學校代碼 | 學校名稱 | 系所代碼 | 系所名稱     | 學制         | 僑生總計 | 僑生男 | 僑生女 | 港澳生總計 | 港澳生男 | 港澳生女 |
|:-------|:-------|:---------|:---------|:---------|:---------|:-------------|:-------------|:---------|:-------|:-------|:-----------|:---------|:---------|
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 210101   | 美術學系     | 學士班(日間) | 1        | 0      | 1      | 3          | 2        | 1        |
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 210101   | 美術學系     | 碩士班(日間) | 1        | 1      | 0      | 0          | 0        | 0        |
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 220201   | 中國文學系   | 學士班(日間) | 3        | 1      | 2      | 5          | 2        | 3        |
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 220201   | 中國文學系   | 碩士班(日間) | 0        | 0      | 0      | 1          | 0        | 1        |
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 220301   | 外國語文學系 | 學士班(日間) | 15       | 6      | 9      | 10         | 1        | 9        |
| 101    | 私立   | 一般大學 | 1001     | 東海大學 | 220301   | 外國語文學系 | 碩士班(日間) | 1        | 1      | 0      | 0          | 0        | 0        |

``` r
knitr::kable(
  head(testcgu[order(testcgu$"學制",decreasing = T),],)
)
```

| 學年度 | 設立別 | 學校類別 | 學校代碼 | 學校名稱 | 系所代碼 | 系所名稱     | 學制         | 僑生總計 | 僑生男 | 僑生女 | 港澳生總計 | 港澳生男 | 港澳生女 |
|:-------|:-------|:---------|:---------|:---------|:---------|:-------------|:-------------|:---------|:-------|:-------|:-----------|:---------|:---------|
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 230303   | 工業設計學系 | 學士班(日間) | 0        | 0      | 0      | 1          | 0        | 1        |
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 340302   | 工商管理學系 | 學士班(日間) | 2        | 1      | 1      | 3          | 3        | 0        |
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 340901   | 醫務管理學系 | 學士班(日間) | 2        | 1      | 1      | 6          | 1        | 5        |
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 420503   | 生物醫學系   | 學士班(日間) | 8        | 3      | 5      | 5          | 2        | 3        |
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 480109   | 資訊管理學系 | 學士班(日間) | 0        | 0      | 0      | 2          | 1        | 1        |
| 105    | 私立   | 一般大學 | 1009     | 長庚大學 | 520103   | 電子工程學系 | 學士班(日間) | 0        | 0      | 0      | 3          | 3        | 0        |

探索式資料分析
--------------

圖文並茂圖文並茂

``` r
#這是R Code Chunk
library(ggplot2)
library(choroplethr)
```

    ## Loading required package: acs

    ## Loading required package: stringr

    ## Loading required package: plyr

    ## Loading required package: XML

    ## 
    ## Attaching package: 'acs'

    ## The following object is masked from 'package:base':
    ## 
    ##     apply

``` r
library(ggmap)
worldmap <- get_map(location = c(-47.52,-16.99,76.88,-33.37), zoom = 1,language = "zh-TW")
```

    ## Warning: bounding box given to google - spatial extent only approximate.

    ## converting bounding box to center/zoom specification. (experimental)

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=-25.18,14.68&zoom=1&size=640x640&scale=2&maptype=terrain&language=zh-TW&sensor=false

``` r
ggmap(worldmap)
```

    ## Warning in min(x): min 中沒有無漏失的引數; 回傳 Inf

    ## Warning in max(x): max 中沒有無漏失的引數；回傳 -Inf

    ## Warning in min(x): min 中沒有無漏失的引數; 回傳 Inf

    ## Warning in max(x): max 中沒有無漏失的引數；回傳 -Inf

![](README_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
AsiaMap <- get_map(location = "Asia", zoom = 3, maptype = 'satellite',language = "zh-TW")
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=Asia&zoom=3&size=640x640&scale=2&maptype=satellite&language=zh-TW&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Asia&sensor=false

``` r
AsiaMapO <- ggmap(AsiaMap)+ geom_point(data=asiadata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric(在學學生人數_男),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
AsiaMapO
```

    ## Warning: Removed 4 rows containing missing values (geom_point).

![](README_files/figure-markdown_github/unnamed-chunk-3-2.png)

``` r
EuroMap <- get_map(location = "Europe", zoom = 3, maptype = 'satellite')
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=Europe&zoom=3&size=640x640&scale=2&maptype=satellite&language=en-EN&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Europe&sensor=false

``` r
EuroMapO <- ggmap(EuroMap)+ geom_point(data=eurodata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric(studentcount),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
EuroMapO
```

    ## Warning: Removed 1 rows containing missing values (geom_point).

![](README_files/figure-markdown_github/unnamed-chunk-3-3.png)

``` r
OceaniaMap <- get_map(location = "Oceania", zoom = 3, maptype = 'satellite')
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=Oceania&zoom=3&size=640x640&scale=2&maptype=satellite&language=en-EN&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Oceania&sensor=false

``` r
OceaniaMapO <- ggmap(OceaniaMap)+ geom_point(data=Oceaniadata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric(studentcount),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
OceaniaMapO
```

![](README_files/figure-markdown_github/unnamed-chunk-3-4.png)

``` r
AfricaMap <- get_map(location = "Africa", zoom = 3, maptype = 'satellite')
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=Africa&zoom=3&size=640x640&scale=2&maptype=satellite&language=en-EN&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Africa&sensor=false

``` r
AfricaMapO <- ggmap(AfricaMap)+ geom_point(data=SAfricadata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric("在學學生人數_男"),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
AfricaMapO
```

    ## Warning: 強制變更過程中產生了 NA

![](README_files/figure-markdown_github/unnamed-chunk-3-5.png)

``` r
NAMap <- get_map(location = "North America", zoom = 3, maptype = 'satellite')
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=North+America&zoom=3&size=640x640&scale=2&maptype=satellite&language=en-EN&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=North%20America&sensor=false

``` r
NAMapO <- ggmap(NAMap)+ geom_point(data=NAdata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric("在學學生人數_男"),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
NAMapO
```

    ## Warning: 強制變更過程中產生了 NA

    ## Warning: Removed 4 rows containing missing values (geom_point).

![](README_files/figure-markdown_github/unnamed-chunk-3-6.png)

``` r
SAMap <- get_map(location = "South America", zoom = 3, maptype = 'satellite')
```

    ## Map from URL : http://maps.googleapis.com/maps/api/staticmap?center=South+America&zoom=3&size=640x640&scale=2&maptype=satellite&language=en-EN&sensor=false

    ## Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=South%20America&sensor=false

``` r
SAMapO <- ggmap(SAMap)+ geom_point(data=SAdata, 
               aes(x=as.numeric(locationx), y=as.numeric(locationy),
                   color=as.numeric("在學學生人數_男"),size=3.5))+ 
    scale_color_continuous(
        low = "yellow",high = "red")+ 
    guides(size=FALSE)
SAMapO
```

    ## Warning: 強制變更過程中產生了 NA

![](README_files/figure-markdown_github/unnamed-chunk-3-7.png)

期末專題分析規劃
----------------

期末專題會結合手上的資料，按照不同國藉的僑生人數製作圖表及一個世界分佈地圖。然後還會了解數據，找出一些關於僑生的有趣現象在課堂報告跟老師和同學分享。
