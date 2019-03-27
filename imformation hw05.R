###R ggplot2 教學：基本概念與 qplot 函數
install.packages("ggplot2")
library(ggplot2)
head(diamonds)
set.seed(5)
diamonds.subset <- diamonds[sample(nrow(diamonds), 100), ]
##ggplot繪圖文法
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
##qplot函數的運用
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
##圖形樣式
#qplot一些參數可使更改資料點的顏色、大小等樣式
#legend - 圖形上加入圖示說明
#qplot(carat, price, data = diamonds.subset, color = color) - 用color替資料點著色區分不同顏色鑽石
#shape - 以資料點的形狀區分資料
#qplot(carat, price, data = diamonds, alpha = I(1/10))/qplot(carat, price, data = diamonds, alpha = I(1/100)) - 資料點加上透明度的參數使容易辨識實際的資料分佈情況(資料點大量重疊問題)

qplot(carat, price, data = diamonds.subset,
      geom = c("point", "smooth"))
qplot(carat, price, data = diamonds,
      geom = c("point", "smooth"))
##在圖形上加入Smoother
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
##箱形圖與Jitter資料點
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
##直方圖與密度函數
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
##長條圖
#bar(長條圖)
#weight - 指定數值的來源

qplot(date, unemploy / pop, data = economics, geom = "line")
qplot(date, uempmed, data = economics, geom = "line")
qplot(unemploy / pop, uempmed, data = economics,
      geom = c("point", "path"))
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy / pop, uempmed, data = economics,
      geom = "path", colour = year(date))
##時間序列與路徑
#line與path可用來繪製時間序列與路徑類型的資料
#path會依資料中的順序將每個點以線段連接，path是在比較兩個變數隨時間變化的關係
#line會將點的順序依x軸排序，line 圖形的x軸是時間的資訊，來呈現某個變數隨時間的變化
#unemploy(失業人口)/ pop(人口總數)/uempmed(失業時間的中位數)
#year <- function(x) as.POSIXlt(x)$year + 1900 qplot(unemploy / pop, uempmed, data = economics, geom = "path", colour = year(date))加上顏色來表示不同的年份

qplot(carat, data = diamonds, facets = color ~ cut,
      geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
qplot(carat, data = diamonds, facets = color ~ .,
      geom = "histogram", binwidth = 0.1, xlim = c(0, 3))
##繪圖面(Facet)
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
##其他用法
#xlim(設定x軸繪圖範圍)/ylim(設定y軸的繪圖範圍)
#log - 指定對數轉換的座標軸(log ="xy"是讓x與y軸都經過對數轉換)
#main - 指定圖形的標題
#xlab(指定X軸名稱)/ylab(指定y軸名稱)


###qplot範例


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
# 將資料以 gear 與 cylinder 分組
# 畫出 mpg 與 hp 的散佈圖
# 並且以資料點的顏色與形狀標示 am

qplot(gear, mpg, data = mtcars, geom = c("boxplot", "jitter"),
      fill = gear, main = "Mileage by Gear Number",
      xlab = "", ylab = "Miles per Gallon")
# 畫出箱形圖，
# 並且在上面用 jitter 資料點畫出實際資料的位置




###R ggplot2 教學：圖層式繪圖
my.plot <- ggplot(diamonds, aes(carat, price, colour = cut))
##建立圖形物件
#對應參數用aes函數包裝
#aes下的範例是將carat變數對應到x軸、price數對應到y軸
#以顏色區隔cut變數

my.plot <- my.plot + layer(
  geom = "point",
  stat = "identity",
  position = "identity",
  params = list(na.rm = FALSE)
)
my.plot

my.plot2 <- ggplot(diamonds, aes(x = carat))
my.plot2 <- my.plot2 + layer(
  geom = "bar",
  stat = "bin",
  position = "identity",
  params = list(
    fill = "steelblue",
    binwidth = 0.2,
    na.rm = FALSE
  )
)
my.plot2

my.plot3 <- ggplot(diamonds, aes(x = carat))
my.plot3 <- my.plot3 +
  geom_histogram(binwidth = 0.2, fill = "steelblue")
my.plot3
##圖層
#以上的參數都可省略，不指定就會使用內部預設值
#+(疊加至既有的繪圖物件上)
#identity - 不需要特別的轉換與調整就指定為此
#params - 用來指定geom與stat所需的參數
#my.plot - 顯示圖形

#繪製直方圖需用bin統計轉換直方圖每個bin的數值
#position - 指定細部的資料的位置調整

#geom_histogram繪製直方圖
#簡化圖層函數都是以geom_*與stat_*的方式命名
#... - geom與stat所使用的參數

##ggplot與qplot的寫法比較
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) +
  geom_point()
# 做法一
qplot(sleep_rem / sleep_total, awake, data = msleep)
# 做法二

##加入平滑曲線
qplot(sleep_rem / sleep_total, awake, data = msleep) +
  geom_smooth()
# 做法一
qplot(sleep_rem / sleep_total, awake, data = msleep,
      geom = c("point", "smooth"))
# 做法二
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) +
  geom_point() + geom_smooth()
# 做法三

my.plot4 <- ggplot(msleep, aes(sleep_rem / sleep_total, awake))
summary(my.plot4)
my.plot4 <- my.plot4 + geom_point()
summary(my.plot4)

bestfit <- geom_smooth(method = "lm", se = F,
                       color = alpha("steelblue", 0.5), size = 2)
qplot(sleep_rem, sleep_total, data = msleep) + bestfit
qplot(awake, brainwt, data = msleep, log = "y") + bestfit
qplot(bodywt, brainwt, data = msleep, log = "xy") + bestfit
#繪圖物件可用summary查看內容

#建立一個圖層套用在不同繪圖物件上

my.plot5 <- ggplot(mtcars, aes(mpg, wt, colour = cyl)) + geom_point()
my.plot5
mtcars.trans <- transform(mtcars, mpg = mpg ^ 2)
my.plot5 %+% mtcars.trans
#my.plot5 <- ggplot(mtcars, aes(mpg, wt, colour = cyl)) + geom_point() - 當中的colour = cyl要改成數值1才可執行
##資料來源
#%+% - 改變ggplot繪圖物件的資料來源可使用(抽換資料來源)  

aes(x = weight, y = height, color = age)
aes(weight, height, colour = sqrt(age))
##美學對應
#aes(x = weight, y = height, color = age) - 將x軸指定為weight、y軸指定為height，顏色(color)指定為age

my.plot6 <- ggplot(mtcars, aes(x = mpg, y = wt))
my.plot6 <- my.plot6 + geom_point()
summary(my.plot6)

my.plot7 <- ggplot(mtcars)
my.plot7 <- my.plot7 + aes(x = mpg, y = wt)
my.plot7 <- my.plot7 + geom_point()
summary(my.plot7)
my.plot7 + geom_point(aes(colour = factor(cyl)))
my.plot7 + geom_point(aes(y = disp))
aes(y = NULL)
##繪圖與圖層
#預設可在繪圖物件建立時就指定
#也可在繪圖物件建立後再加上aes來指定

#在繪圖物件中設定可在圖層中增加、修改或刪除
#aes(y = NULL) - 刪除某一參數把參數設定為NULL
#my.plot7 + geom_point(aes(colour = factor(cyl)) - 當中的colour = factor(cyl)要改成數值1才可執行

my.plot8 <- ggplot(mtcars, aes(mpg, wt))
my.plot8 + geom_point(colour = "blue")
my.plot8 + geom_point(aes(colour = "blue"))
##設定與對應
#colour = "blue" - 資料點的顏色指定為藍色
#aes函數 - 代表對應關係
#加上aes函數內部產生的blue對應呈粉紅色
#qplot函數中要設定固定參數要額外用I函數(color = I("blue"))

my.plot9 <- ggplot(Oxboys, aes(age, height)) +
  geom_line()
my.plot9 <- ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_line()
##群組(Grouping)/基本群組
#以nlme套件中Oxboys資料集繪圖
#畫出多條時間序列的線條可加上group並指定為個體的變數

my.plot9 + geom_smooth(method="lm", se = F)
my.plot9 + geom_smooth(aes(group = 1), method="lm", size = 2, se = F)

boysbox <- ggplot(Oxboys, aes(Occasion, height)) + geom_boxplot()
boysbox + geom_line(aes(group = Subject), color = "blue")
##圖層與群組
#加上一條線性迴歸線可用geom_smooth配合method = "lm"，加上group可對每個各體畫出各自的迴歸線
#group設為一個固定的值(取消群組的功能)

#將height依Occasion畫出箱形圖
#Occasion - 離散型變數，不需特別指定group
#geom_line依Subject區分資料畫出每個的資料並另外加color參數設定線條顏色

my.df <- data.frame(x = 1:3, y = 1:3, z = 1:3)
qplot(x, y, data = my.df, color = factor(z), size = I(5)) +
  geom_line(size = 3, group = 1)
qplot(color, data = diamonds, geom = "bar",
      fill = cut)
##美學對應與幾何圖形
#繪製line或path的線段時，第一條線段會用第一個點的顏色，第二條線段會用第二個點的顏色，依序下去
#ggplot會自動將資料依變數分組

ggplot(diamonds, aes(carat)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.1)
qplot(carat, ..density.., data = diamonds,
      geom="histogram", binwidth = 0.1)
##統計轉換(Stat)
#stat_bin用於建立直方圖的統計轉換會產生count(每個bin的資料點數)、density(每個bin的資料點數比例)、ncount(將count標準化最大值為1)、ndensity(將density標準化最大值為1)
#density(密度為單位可使用) 
#統計轉換所產生的變數時必須前後加上 ..

ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar(position="dodge")
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar(position="fill")
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar(position="stack")

ggplot(diamonds, aes(clarity, group = cut)) +
  geom_line(aes(color = cut), position="identity", stat = "count")

set.seed(5)
diamonds.subset <- diamonds[sample(nrow(diamonds), 500), ]
ggplot(diamonds.subset, aes(clarity, cut)) +
  geom_point(aes(color = color), position="jitter")
##位置調整(Position)
#主要用於調整圖層中幾何圖形比較細微的位置選項
#可用的位置調整選項：dodge(並列顯示)、fill(標準化堆疊顯示)、identity(不調整位置)、jitter(使用jitter方式避免資料點重疊)、stack(堆疊顯示)

#identity適合用在一般的折線圖

#jitter適用於以資料點繪製類型資料的情況

my.plot <- ggplot(diamonds, aes(carat)) + xlim(0, 3)
my.plot + stat_bin(aes(ymax = ..count..), binwidth = 0.1, geom = "area")
my.plot + stat_bin(
  aes(size = ..density..), binwidth = 0.1,
  geom = "point", position="identity"
)
##幾何圖形與統計轉換
#以count統計轉換
#my.plot + stat_bin( aes(size = ..density..), binwidth = 0.1, geom = "point", position="identity")配合點的幾何圖形的結果
#用stat_identity統計轉換會依原始資料的類型直接選擇適合的幾何圖形來呈現

library(nlme)
model <- lme(height ~ age, data = Oxboys, random = ~ 1 + age | Subject)
age_grid <- seq(-1, 1, length = 10)
subjects <- unique(Oxboys$Subject)
preds <- expand.grid(age = age_grid, Subject = subjects)
preds$height <- predict(model, preds)

my.plot <- ggplot(Oxboys, aes(age, height, group = Subject)) + geom_line()
my.plot + geom_line(data = preds, colour = "#3366FF", size= 0.4)

Oxboys$fitted <- predict(model)
Oxboys$resid <- with(Oxboys, fitted - height)
my.plot %+% Oxboys + aes(y = resid) + geom_smooth(aes(group=1))
##不同的資料來源
#執行nlme
#不同的圖層有不同的資料來源，可將相關幾個資料集畫在一起(例如用模型預測資料時繪製預測值)

#畫出模型的預測值

#畫出模型的殘差值並加入平滑曲線

# *(159-188)*


