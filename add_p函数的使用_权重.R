library(gtsummary)
library(survey)

# 创建一个简单的示例数据集
set.seed(123)
n <- 200
df <- data.frame(
  Age = rnorm(n, mean = 50, sd = 10),
  Sex = sample(c("Male", "Female"), n, replace = TRUE),
  Race = sample(c("White", "Black", "Asian"), n, replace = TRUE),
  BMI.group = sample(c("Underweight", "Normal", "Overweight", "Obese"), n, replace = TRUE),
  Education.attainment = sample(c("Less than high school", "High school or equivalent", "University degree or above"), n, replace = TRUE),
  Diabetes = sample(c("Yes", "No"), n, replace = TRUE),
  Hypertension = sample(c("Yes", "No"), n, replace = TRUE),
  Stroke = sample(c("Yes", "No"), n, replace = TRUE),
  OHD = runif(n, min = 20, max = 40)
)

# 创建一个调查设计对象
design <- svydesign(ids = ~1, data = df, weights = ~rep(1, n))#weights = 这里控制分类变量的百分比是否加权

# 创建描述性统计表
tbl <- tbl_svysummary(design,
                      by = Sex,
                      include = c(Age, BMI.group, Education.attainment, Diabetes, Hypertension, Stroke, OHD),
                      statistic = list(all_continuous() ~ "{mean} ({sd})", 
                                       all_categorical() ~ "{n_unweighted} ({p}%)"),
                      digits = list(Age ~ 2, BMI.group ~ 0, Education.attainment ~ 0, Diabetes ~ 0, 
                                    Hypertension ~ 0, Stroke ~ 0, OHD ~ 4),  #  # 设置 变量百分比的小数点后n位
                      sort = list(BMI.group ~ "alphanumeric"),
                      missing = 'no') %>%
  add_overall() %>%
  add_p(pvalue_fun = function(x) format(round(x, 3), nsmall = 2))%>%#设置p值的小数位数和保留后面的0，还是我的好使
  # add_p(pvalue_fun=~style_pvalue(.x,digits = 4))%>%
  modify_header(
    all_stat_cols() ~ "**{level}**, N = {n_unweighted} ({style_percent(p)}%)",
    p.value = "**P Value**") %>%
  modify_spanning_header(
    stat_0 ~ NA, 
    update = all_stat_cols() ~ "**Sex**") %>% 
  modify_footnote(
    update = all_stat_cols() ~ "mean (sd) for continuous; n (%) for categorical") %>%
  bold_labels() %>%  # 给变量名加粗
  bold_p(0.05)  # 给有显著性的 p 值加粗
tbl
table(design$variables$Education.attainment)
table(df$Education.attainment)

# 打印表格
tbl


