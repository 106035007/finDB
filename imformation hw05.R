##R ggplot2 教學：基本概念與 qplot 函數
install.packages("ggplot2")
library(ggplot2)
head(diamonds)
set.seed(5)
diamonds.subset <- diamonds[sample(nrow(diamonds), 100), ]
ggplot繪圖文法
#安裝 ggplot2 套件
#執行 ggplot2 套件
#用head看diamonds資料
#diamonds資料集的資料有五萬多筆
#diamonds.subset <- diamonds[sample(nrow(diamonds), 100), ]
#抽出100筆資料存在diamonds.subset中

qplot(diamonds$carat, diamonds$price)
qplot(carat, price, data = diamonds)
qplot(log(carat), log(price), data = diamonds)
qplot(carat, x * y * z, data = diamonds)
qplot函數的運用
#qplot函數是ggplot中最基本的繪圖函數
#qplot 的用法是x軸與y軸的座標資料為參數(ex：qplot(diamonds$carat, diamonds$price))
#qplot(carat, price, data = diamonds) - 使用data參數指定資料的來源
#price(價格)/carat(克拉數)
#log(對數) - 可透過此轉換不是線性關係的圖表
#qplot(log(carat), log(price), data = diamonds)鑽石的價格與克拉數有明顯的關係
#qplot(carat, x * y * z, data = diamonds) - 使用多個變數進行運算，大部分鑽石的體積都與重量成正比(密度都差不多)，也有超出的

qplot(carat, price, data = diamonds.subset, color = color)
qplot(carat, price, data = diamonds.subset, shape = cut)
qplot(carat, price, data = diamonds, alpha = I(1/10))
qplot(carat, price, data = diamonds, alpha = I(1/100))
圖形樣式
#qplot一些參數可使更改資料點的顏色、大小等樣式
#legend - 圖形上加入圖示說明
#qplot(carat, price, data = diamonds.subset, color = color) - 用color替資料點著色區分不同顏色鑽石
#shape - 以資料點的形狀區分資料
#qplot(carat, price, data = diamonds, alpha = I(1/10))/qplot(carat, price, data = diamonds, alpha = I(1/100)) - 資料點加上透明度的參數使容易辨識實際的資料分佈情況(資料點大量重疊問題)

qplot(carat, price, data = diamonds.subset,
      geom = c("point", "smooth"))
qplot(carat, price, data = diamonds,
      geom = c("point", "smooth"))
在圖形上加入Smoother
#point(點呈現資料)/smooth(平滑曲線與標準誤差)
#同時指定多種幾何圖形(geom)可使用c函數

qplot(color, price / carat, data = diamonds, geom = "boxplot")
qplot(color, price / carat, data = diamonds, geom = "jitter")
qplot(color, price / carat, data = diamonds,
      geom = "jitter", alpha = I(1 / 5))
qplot(color, price / carat, data = diamonds, geom = "jitter",
      alpha = I(1 / 50))
qplot(color, price / carat, data = diamonds, geom = "jitter",
      alpha = I(1 / 200))
箱形圖與Jitter資料點
#boxplot(箱形圖)
#boxplot - 資料同時含一個類型的變數及一個或多個連續型變數時可使用
#更細部的資訊可使用jitter
#透明度 alpha = I(1 / 5)
#調整圖形可使用size、color、shape
#箱形圖可使用color、fill、size調整顏色與線條粗細

qplot(color, price / carat, data = diamonds, geom = "jitter",
      alpha = I(1 / 5), shape = cut)
# 以資料點的形狀區分 cut 變數

qplot(color, price / carat, data = diamonds, geom = "jitter",
      alpha = I(1 / 5), color = color)
# 以資料點的顏色區分 color 變數

qplot(color, price / carat, data = diamonds, geom = "jitter",
      alpha = I(1 / 5), color = cut)
# 以資料點的顏色區分 cut 變數

qplot(color, price / carat, data = diamonds, geom = "boxplot",
      color = color)
# 以箱形圖的外框顏色區分 color 變數

qplot(color, price / carat, data = diamonds, geom = "boxplot",
      fill = color)
# 以箱形圖的內部顏色區分 color 變數

qplot(color, price / carat, data = diamonds, geom = "boxplot",
      size = I(2))
# 調整箱形圖的外框粗細

qplot(carat, data = diamonds, geom = "histogram")
qplot(carat, data = diamonds, geom = "histogram",
      binwidth = 0.5, xlim = c(0, 3))
qplot(carat, data = diamonds, geom = "histogram",
      binwidth = 0.01, xlim = c(0, 3))
qplot(carat, data = diamonds, geom = "histogram",
      fill = color)
qplot(carat, data = diamonds, geom = "density")
qplot(carat, data = diamonds, geom = "density", adjust = 3)
qplot(carat, data = diamonds, geom = "density",
      color = color)
qplot(carat, ..density.., data = diamonds,
      geom = c("histogram", "density"))
直方圖與密度函數
#histogram(直方圖0
#bin 寬度可使用binwidth調整
#qplot(carat, data = diamonds, geom = "histogram",binwidth = 0.01, xlim = c(0, 3))(細部資訊可能要在bin寬度非常小的情況下才會顯現)
#qplot(carat, data = diamonds, geom = "histogram",fill = color) - 不同顏色畫出不同鑽石顏色的資料產生堆疊的直方圖呈現多組資料
#adjust調整密度圖的平滑程度(值越大曲線越平滑)
#qplot(carat, data = diamonds, geom = "density",color = color) - 呈現多組資料
#qplot(carat, ..density.., data = diamonds,geom = c("histogram", "density")) - 直方圖密度函數圖畫在一起

qplot(color, data = diamonds, geom = "bar")
qplot(color, data = diamonds, geom = "bar", weight = carat) +
  ylab("carat")
長條圖
#bar(長條圖)
#weight - 指定數值的來源

qplot(date, unemploy / pop, data = economics, geom = "line")
qplot(date, uempmed, data = economics, geom = "line")
qplot(unemploy / pop, uempmed, data = economics,
      geom = c("point", "path"))
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy / pop, uempmed, data = economics,
      geom = "path", colour = year(date))
時間序列與路徑
#line與path可用來繪製時間序列與路徑類型的資料
#path會依資料中的順序將每個點以線段連接，path是在比較兩個變數隨時間變化的關係
#line會將點的順序依x軸排序，line 圖形的x軸是時間的資訊，來呈現某個變數隨時間的變化
#unemploy(失業人口)/ pop(人口總數)/uempmed(失業時間的中位數)
#year <- function(x) as.POSIXlt(x)$year + 1900 qplot(unemploy / pop, uempmed, data = economics, geom = "path", colour = year(date))加上顏色來表示不同的年份

qplot(carat, data = diamonds, facets = color ~ cut,
      geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
qplot(carat, data = diamonds, facets = color ~ .,
      geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
繪圖面(Facet)
#facets(資料區隔方式)
#row(列)/column(行)
#只需對一個變數分組將公式另一側指定為一個句點（.）

qplot(
  carat, price, data = diamonds.subset,
  xlab = "Price ($)", ylab = "Weight (carats)",
  main = "Price-weight relationship"
)
qplot(
  carat, price/carat, data = diamonds.subset,
  ylab = expression(frac(price,carat)),
  xlab = "Weight (carats)",
  main="Small diamonds",
  xlim = c(.2,1)
)
qplot(carat, price, data = diamonds.subset, log = "xy")
其他用法
#xlim(設定x軸繪圖範圍)/ylim(設定y軸的繪圖範圍)
#log - 指定對數轉換的座標軸(log ="xy"是讓x與y軸都經過對數轉換)
#main - 指定圖形的標題
#xlab(指定X軸名稱)/ylab(指定y軸名稱)


qplot範例


mtcars$gear <- factor(mtcars$gear,levels=c(3, 4, 5),
                      labels=c("3gears", "4gears", "5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0, 1),
                    labels=c("Automatic", "Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4, 6, 8),
                     labels=c("4cyl", "6cyl", "8cyl"))
# 產生繪圖用的因子變數

qplot(mpg, data = mtcars, geom = "density",
      fill = gear, alpha = I(.5),
      main="Distribution of Gas Milage",
      xlab="Miles Per Gallon",
      ylab="Density")
# 以 gear 分組畫出 mpg 密度函數圖

qplot(hp, mpg, data = mtcars, shape = am, color = am,
      facets = gear~cyl, size = I(3),
      xlab = "Horsepower", ylab = "Miles per Gallon")
# 將資料以 gear 與 cylinder 分組，
# 畫出 mpg 與 hp 的散佈圖，
# 並且以資料點的顏色與形狀標示 am

qplot(gear, mpg, data = mtcars, geom = c("boxplot", "jitter"),
      fill = gear, main = "Mileage by Gear Number",
      xlab = "", ylab = "Miles per Gallon")
# 畫出箱形圖，
# 並且在上面用 jitter 資料點畫出實際資料的位置


##R ggplot2 教學：圖層式繪圖
my.plot <- ggplot(diamonds, aes(carat, price, colour = cut))
建立圖形物件
#對應參數用aes函數包裝
#aes下的範例是將carat變數對應到x軸、price數對應到y軸
#以顏色區隔cut變數



