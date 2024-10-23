axis.ticks.y = element_blank(),
axis.text.x=element_text(size=8,color="black"),
plot.title = element_text(size =10,vjust=0.5,hjust=0.5,color="black"),
axis.title.x = size(10),
plot.margin = margin(l=5,t=5,b=5,r=10))
c <- read_tsv("F1_C.xls") %>%
mutate(score_log = log10(score + min(score[score > 0]) / 2)) %>%
ggplot(.,aes(x = score_type, y = score_log)) +
geom_violin(scale = "width", width = 0.8) +
geom_quasirandom(aes(colour = fuso_load),size = 0.5,alpha = 0.5) +
coord_flip() +
theme_classic(7) +
scale_colour_manual(values = c("#bd3106","#5b7314","#454b87","#d9700e","#89a6bb","#eebe04"),
labels = c("No", "Low", "High")) +
labs(colour = "Fusobacterium\nload",
y = "_Fusobacterium_ abundance (log<sub>10</sub> score)",
x = NULL,
title = "Cancer tissue sample") +
theme(legend.position = "none",
axis.text.y = element_blank(),
axis.ticks.y = element_blank(),
axis.text.x=element_text(size=8,color="black"),
plot.title = element_text(size =10,vjust=0.5,hjust=0.5,color="black"),
plot.margin = margin(l=5,t=5,b=5,r=10))
d <- read_tsv('F1_D.xls',col_types = cols()) %>%
count(cms, score_type, fuso_load) %>%
group_by(cms, score_type) %>%
mutate(prop = n / sum(n)) %>%
ggplot(.,aes(x = cms,y = prop,fill = fct_rev(fuso_load))) +
geom_col() + theme_classic(7) +
scale_fill_manual(values = c("#bd3106","#5b7314","#454b87","#d9700e","#89a6bb","#eebe04"),
breaks = c("c0_no", "c1_low", "c2_high"),
labels = c("No", "Low", "High")) +
theme(legend.position = "right",
legend.box.margin=margin(0, 0, 0, -10),
legend.key.height = unit(10, "pt"),
legend.key.width = unit(10, "pt")) +
labs(y = "Proportion",x = NULL,fill = "_Fusobacterium_<br>load") +
guides(fill = guide_legend(title.position = "top"))
a2 <- read_tsv("F1-A-2.xls") %>%
ggplot(.,aes(Health.status,log10(value),
colour=Health.status)) +
geom_jitter(width = 0.3, size =2, stroke = 0) +
geom_violin(colour = "grey", fill = NA) +
theme_bw() +
facet_wrap(~ Genus, ncol = 2)+
scale_y_continuous(breaks = 0:6) +
scale_color_manual(values = c("orange", "steelblue"))+
coord_flip()+
theme(legend.position = "none",
axis.title.x = element_markdown(),
axis.text.y = element_blank(),
axis.ticks.y = element_blank(),
strip.background = element_blank(),
panel.spacing.y = unit(0, "mm"),
strip.text.x = element_text(face = "italic",size = 10,margin = margin(0,0,0, 0, "pt"))) +
labs(x = NULL)
a2 <- read_tsv("F1-A-2.xls") %>%
ggplot(.,aes(Health.status,log10(value),
colour=Health.status)) +
geom_jitter(width = 0.3, size =2, stroke = 0) +
geom_violin(colour = "grey", fill = NA) +
theme_bw() +
facet_wrap(~ Genus, ncol = 2)+
scale_y_continuous(breaks = 0:6) +
scale_color_manual(values = c("orange", "steelblue"))+
coord_flip()+
theme(legend.position = "none",
axis.text.y = element_blank(),
axis.ticks.y = element_blank(),
strip.background = element_blank(),
panel.spacing.y = unit(0, "mm"),
strip.text.x = element_text(face = "italic",size = 10,margin = margin(0,0,0, 0, "pt"))) +
labs(x = NULL)
c <- read_tsv("F1_C.xls") %>%
mutate(score_log = log10(score + min(score[score > 0]) / 2)) %>%
ggplot(.,aes(x = score_type, y = score_log)) +
geom_violin(scale = "width", width = 0.8) +
geom_quasirandom(aes(colour = fuso_load),size = 0.5,alpha = 0.5) +
coord_flip() +
theme_classic(7) +
scale_colour_manual(values = c("#bd3106","#5b7314","#454b87","#d9700e","#89a6bb","#eebe04"),
labels = c("No", "Low", "High")) +
labs(colour = "Fusobacterium\nload",
y = "_Fusobacterium_ abundance (log<sub>10</sub> score)",
x = NULL,
title = "Cancer tissue sample") +
theme(legend.position = "none",
axis.text.y = element_blank(),
axis.ticks.y = element_blank(),
axis.text.x=element_text(size=8,color="black"),
plot.title = element_text(size =10,vjust=0.5,hjust=0.5,color="black"),
plot.margin = margin(l=5,t=5,b=5,r=10))
d <- read_tsv('F1_D.xls',col_types = cols()) %>%
count(cms, score_type, fuso_load) %>%
group_by(cms, score_type) %>%
mutate(prop = n / sum(n)) %>%
ggplot(.,aes(x = cms,y = prop,fill = fct_rev(fuso_load))) +
geom_col() + theme_classic(7) +
scale_fill_manual(values = c("#bd3106","#5b7314","#454b87","#d9700e","#89a6bb","#eebe04"),
breaks = c("c0_no", "c1_low", "c2_high"),
labels = c("No", "Low", "High")) +
theme(legend.position = "right",
legend.box.margin=margin(0, 0, 0, -10),
legend.key.height = unit(10, "pt"),
legend.key.width = unit(10, "pt")) +
labs(y = "Proportion",x = NULL,fill = "_Fusobacterium_<br>load") +
guides(fill = guide_legend(title.position = "top"))
a2 <- read_tsv("F1-A-2.xls") %>%
ggplot(.,aes(Health.status,log10(value),
colour=Health.status)) +
geom_jitter(width = 0.3, size =2, stroke = 0) +
geom_violin(colour = "grey", fill = NA) +
theme_bw() +
facet_wrap(~ Genus, ncol = 2)+
scale_y_continuous(breaks = 0:6) +
scale_color_manual(values = c("orange", "steelblue"))+
coord_flip()+
theme(legend.position = "none",
axis.text.y = element_blank(),
axis.ticks.y = element_blank(),
strip.background = element_blank(),
panel.spacing.y = unit(0, "mm"),
strip.text.x = element_text(face = "italic",size = 10,margin = margin(0,0,0, 0, "pt"))) +
labs(x = NULL)
get_reverted_fig1_cor_hc <- function(mtx) {
hc <- hclust(
d = as.dist(1 - cor(mtx, method = "pearson")),
"complete")
sv <- svd(mtx)$v[, 1]
dend <- reorder(as.dendrogram(hc), wts = sv)
as.hclust(dend)
}
plot_fig1_heatmap <- function(mtx, ha, boi) {
Heatmap(mtx,name = "Abundance",
col = colorRamp2(c(0, 6), c("#000033","#66CCFF")),
show_column_names = FALSE,row_split = 2,column_split = 2,
row_names_gp = gpar(fontsize = 6,fontface = "italic",
col = if_else(rownames(mtx) %in% boi,"red", "black")),
heatmap_legend_param = list(
title_gp = gpar(fontsize = 7),
labels_gp = gpar(fontsize = 6),
legend_height = unit(15, "mm"),
direction = "vertical",
grid_width = unit(8, "pt"),
grid_height = unit(10, "pt")
),
row_title = NULL,
column_title = NULL,
cluster_rows = get_reverted_fig1_cor_hc(t(mtx)),
cluster_columns = get_reverted_fig1_cor_hc(mtx),
column_dend_height = unit(5, "mm"),
row_dend_width = unit(4, "mm"),
top_annotation = ha,
height = unit(nrow(mtx) * unit(12, "pt")),
width = unit(ncol(mtx) * unit(2, "pt")),
raster_quality = 5, use_raster = TRUE
)
}
fig_1a_mtx <- read_tsv("f1-a1-1.txt") %>%
mutate(across(phylum, str_replace_all, "_", " ")) %>%
column_to_rownames("phylum") %>%
as.matrix()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% select(samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select(samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
read_tsv("f1-A1.txt")
read_tsv("f1-A1.txt") %>% select(samples, Health.status)
fig_1a_annotation <- read_tsv("f1-A1.txt") %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select(samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% select(.,samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select(.,samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% select_(.,samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select(.,samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% select_at(.,samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select(.,samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% select_at(.,samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
select_at(.,samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
library(dplyr)
# 创建一个示例数据框
df <- data.frame(
A = 1:5,
B = letters[1:5],
C = 6:10
)
# 选择列A和B
selected_df <- df %>%
select(A, B)
library(dplyr)
# 创建一个示例数据框
df <- data.frame(
A = 1:5,
B = letters[1:5],
C = 6:10
)
# 选择列A和B
selected_df <- df %>%
select("A", "B")
library(dplyr)
read_tsv("f1-A1.txt") %>% dplyr::select(samples, Health.status)
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% dplyr::select(samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
dplyr::select(samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`, recode,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
read_tsv("f1-A1.txt") %>% dplyr::select(samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
dplyr::select(samples, `Patient status` = Health.status)
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% dplyr::select(samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
dplyr::select(samples, `Patient status` = Health.status) %>%
mutate(across(`Patient status`,
"no_cancer" = "Healthy",
"cancer" = "Cancer")) %>%
deframe()
fig_1a_annotation <- read_tsv("f1-A1.txt") %>% dplyr::select(samples, Health.status) %>%
filter(samples %in% colnames(fig_1a_mtx)) %>%
as.data.frame() %>%
dplyr::select(samples, `Patient status` = Health.status) %>%
deframe()
fig_1a_ha <- HeatmapAnnotation("Patient status" = fig_1a_annotation[colnames(fig_1a_mtx)],
simple_anno_size = unit(2, "mm"),
annotation_name_gp = gpar(fontsize =9,lineheight = 0.5),
annotation_legend_param = list(
title_gp = gpar(fontsize = 7),
labels_gp = gpar(fontsize =6)
),
col = list("Patient status" = c(Healthy = "steelblue",
Cancer = "orange")))
a1 <- plot_fig1_heatmap(fig_1a_mtx,
fig_1a_ha,
c("Streptococcus",
"Pseudomonas",
"Gemella",
"Prevotellaceae Ga6A1 group",
"Prevotella 7",
"Peptostreptococcus",
"Parvimonas",
"Porphyromonas",
"Fusobacterium",
"Prevotella"))
p2 <- (c|d)
setwd("D:/wd/document/R分析/[会员专享]ggplot2批量绘制蜂窝图并添加显著性标记")
library(tidyverse)
library(gapminder)
library(patchwork)
library(ggbeeswarm)
library(ggsci)
library(multcompView)
library(magrittr)
library(dplyr)
data <- read_tsv("data.txt") %>% filter(continent !="Oceania") %>%
select(2,3,4)
pacman::p_load(tidyverse,ggrepel,FactoMineR,magrittr,factoextra,RColorBrewer)
library(dplyr)
df <- read_tsv("F3.xls")
setwd("D:/wd/document/R分析/跟着Nature学绘图(6)PCA分析数据可视化")
df <- read_tsv("F3.xls")
pca <- df %>% column_to_rownames(var="Sample_id") %>%
select(-Subtype) %>% prcomp(.,scale. = TRUE)
??select
??MASS
??MASS::select
??dplyr::select
# the univariable MR analysis of the causal effect of EduYears on EC
#### 1.加载包 ####
library(devtools)
library(tidyr)
# devtools::install_github("MRCIEU/MRInstruments")
library(MRInstruments)
library(MendelianRandomization)
library(TwoSampleMR)
#install.packages("simex")
library(simex)
#install_github("rondolab/MR-PRESSO")
library(MRPRESSO)
setwd("D:/wd/document/MR练习")
#### 2.主要MR分析 ####
mydata <- read.table("0.mydata_edu_cancer.txt", header=T, sep="\t", check.names = F, stringsAsFactors = F)
heterogeneity <- mr_heterogeneity(mydata)#通过调用 "mr_heterogeneity" 函数来计算数据的异质性
heterogeneity#根据输出结果，我们可以看到数据中有两个不同的 exposure（暴露）和 outcome（结果）对应着不同的方法和异质性的统计指标。其中第一个 exposure 和 outcome 组合对应的方法是 MR Egger，其 Q 统计量为 347.7875，自由度为 362，p 值为 0.6951200。而第二个 exposure 和 outcome 组合对应的方法是 Inverse variance weighted，其 Q 统计量为 347.8263，自由度为 363，p 值为 0.7075905。
### 二选一
# 2.1 如果I2<25%或Q_P>0.05，使用固定效应的逆方差加权法（IVW）Inverse variance weighted
mr_results <- mr(mydata, method_list=c('mr_ivw_fe'))
mr_results
# 留一法敏感性测试
single <- mr_leaveoneout(mydata)
top_30 <- single[order(single$p), ][1:30, ] # 只保留P最小的前30个
plot3 <- mr_leaveoneout_plot(top_30)
plot3
view(single)
top_30 <- single[order(single$p), ] # 只保留P最小的前30个
plot3 <- mr_leaveoneout_plot(top_30)
plot3
for(i in 1:length(single)){
which(is.na(single[,i]))
}
for(i in 1:length(single)){
print(which(is.na(single[,i])))
}
top_30 <- single[order(single$p), ][1:30, ] # 只保留P最小的前30个
plot3 <- mr_leaveoneout_plot(top_30)
plot3
leaveoneout_results=single
res <- plyr::dlply(leaveoneout_results, c("id.exposure",
"id.outcome"), function(d) {
d <- plyr::mutate(d)
if (sum(!grepl("All", d$SNP)) < 3) {
return(blank_plot("Insufficient number of SNPs"))
}
d$up <- d$b + 1.96 * d$se
d$lo <- d$b - 1.96 * d$se
d$tot <- 1
d$tot[d$SNP != "All"] <- 0.01
d$SNP <- as.character(d$SNP)
nom <- d$SNP[d$SNP != "All"]
nom <- nom[order(d$b)]
d <- rbind(d, d[nrow(d), ])
d$SNP[nrow(d) - 1] <- ""
d$b[nrow(d) - 1] <- NA
d$up[nrow(d) - 1] <- NA
d$lo[nrow(d) - 1] <- NA
d$SNP <- ordered(d$SNP, levels = c("All", "", nom))
ggplot2::ggplot(d, ggplot2::aes(y = SNP, x = b)) + ggplot2::geom_vline(xintercept = 0,
linetype = "dotted") + ggplot2::geom_errorbarh(ggplot2::aes(xmin = lo,
xmax = up, size = as.factor(tot), colour = as.factor(tot)),
height = 0) + ggplot2::geom_point(ggplot2::aes(colour = as.factor(tot))) +
ggplot2::geom_hline(ggplot2::aes(yintercept = which(levels(SNP) %in%
"")), colour = "grey") + ggplot2::scale_colour_manual(values = c("black",
"red")) + ggplot2::scale_size_manual(values = c(0.3,
1)) + ggplot2::theme(legend.position = "none", axis.text.y = ggplot2::element_text(size = 8),
axis.ticks.y = ggplot2::element_line(size = 0),
axis.title.x = ggplot2::element_text(size = 8)) +
ggplot2::labs(y = "", x = paste0("MR leave-one-out sensitivity analysis for\n'",
d$exposure[1], "' on '", d$outcome[1], "'"))
})
res <- plyr::dlply(leaveoneout_results, c("id.exposure",
"id.outcome"), function(d) {
d <- plyr::mutate(d)
if (sum(!grepl("All", d$SNP)) < 3) {
return(blank_plot("Insufficient number of SNPs"))
}
d$up <- d$b + 1.96 * d$se
d$lo <- d$b - 1.96 * d$se
d$tot <- 1
d$tot[d$SNP != "All"] <- 0.01
d$SNP <- as.character(d$SNP)
nom <- d$SNP[d$SNP != "All"]
nom <- nom[order(d$b)]
d <- rbind(d, d[nrow(d), ])
d$SNP[nrow(d) - 1] <- ""
d$b[nrow(d) - 1] <- NA
d$up[nrow(d) - 1] <- NA
d$lo[nrow(d) - 1] <- NA
d$SNP <- ordered(d$SNP, levels = c("All", "", nom))
ggplot2::ggplot(d, ggplot2::aes(y = SNP, x = b)) + ggplot2::geom_vline(xintercept = 0,
linetype = "dotted") + ggplot2::geom_errorbarh(ggplot2::aes(xmin = lo,
xmax = up, size = as.factor(tot), colour = as.factor(tot)),
height = 0) + ggplot2::geom_point(ggplot2::aes(colour = as.factor(tot))) +
ggplot2::geom_hline(ggplot2::aes(yintercept = which(levels(SNP) %in%
"")), colour = "grey") + ggplot2::scale_colour_manual(values = c("black",
"red")) + ggplot2::scale_size_manual(values = c(0.3,
1)) + ggplot2::theme(legend.position = "none", axis.text.y = ggplot2::element_text(size = 8),
axis.ticks.y = ggplot2::element_line(size = 0),
axis.title.x = ggplot2::element_text(size = 8)) +
ggplot2::labs(y = "", x = paste0("MR leave-one-out sensitivity analysis for\n'",
d$exposure[1], "' on '", d$outcome[1], "'"))
})
res
top_30 <- single[order(single$p), ][1:30, ] # 只保留P最小的前30个
leaveoneout_results=top_30
res <- plyr::dlply(leaveoneout_results, c("id.exposure",
"id.outcome"), function(d) {
d <- plyr::mutate(d)
if (sum(!grepl("All", d$SNP)) < 3) {
return(blank_plot("Insufficient number of SNPs"))
}
d$up <- d$b + 1.96 * d$se
d$lo <- d$b - 1.96 * d$se
d$tot <- 1
d$tot[d$SNP != "All"] <- 0.01
d$SNP <- as.character(d$SNP)
nom <- d$SNP[d$SNP != "All"]
nom <- nom[order(d$b)]
d <- rbind(d, d[nrow(d), ])
d$SNP[nrow(d) - 1] <- ""
d$b[nrow(d) - 1] <- NA
d$up[nrow(d) - 1] <- NA
d$lo[nrow(d) - 1] <- NA
d$SNP <- ordered(d$SNP, levels = c("All", "", nom))
ggplot2::ggplot(d, ggplot2::aes(y = SNP, x = b)) + ggplot2::geom_vline(xintercept = 0,
linetype = "dotted") + ggplot2::geom_errorbarh(ggplot2::aes(xmin = lo,
xmax = up, size = as.factor(tot), colour = as.factor(tot)),
height = 0) + ggplot2::geom_point(ggplot2::aes(colour = as.factor(tot))) +
ggplot2::geom_hline(ggplot2::aes(yintercept = which(levels(SNP) %in%
"")), colour = "grey") + ggplot2::scale_colour_manual(values = c("black",
"red")) + ggplot2::scale_size_manual(values = c(0.3,
1)) + ggplot2::theme(legend.position = "none", axis.text.y = ggplot2::element_text(size = 8),
axis.ticks.y = ggplot2::element_line(size = 0),
axis.title.x = ggplot2::element_text(size = 8)) +
ggplot2::labs(y = "", x = paste0("MR leave-one-out sensitivity analysis for\n'",
d$exposure[1], "' on '", d$outcome[1], "'"))
})
res
options(warn = F)
plot3 <- mr_leaveoneout_plot(top_30)
plot3
# ## 设置警告信息的显示方式
options(warn = -1)  # 不显示警告信息
plot3 <- mr_leaveoneout_plot(top_30)
plot3
# 查找R语言历史代码
# 参考https://zhuanlan.zhihu.com/p/567784244
# 本电脑位置C:\Users\admin\AppData\Local\RStudio，找到里面的history_database，里面有过去的代码
read_lines("C:\\Users\\admin\\AppData\\Local\\RStudio\\history_database")
timestamp <- 1711033804092 / 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
timestamp <- 1711870107298/ 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
timestamp <- 1710068439380/ 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
timestamp <- 1711033804084/ 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
timestamp <- 1711033804092/ 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
timestamp <- 1711033804092/ 1000
# 将时间戳转换为POSIXct对象
converted_time <- as.POSIXct(timestamp, origin = "1970-01-01")
# 打印转换后的日期和时间
print(converted_time)
history("1.history")
savehistory("1.history")
savehistory("D:/wd/代码记录.R")
savehistory("D:/wd/代码记录.R",append=T)
savehistory("D:/wd/代码记录.R")
time()
now()
today()
savecode=function()
{
savehistory(paste0(getwd(),today(),"代码记录.R",sep=""))
}
savehistory(paste0("D:/wd/代码/R",today(),"代码记录.R",sep=""))
savecode=function()
{
savehistory(paste0("D:/wd/代码/R",today(),"代码记录.R",sep=""))
}
paste0("D:/wd/代码/R",today(),"代码记录.R",sep="")
savecode=function()
{
savehistory(paste0("D:/wd/代码/R/",today(),"代码记录.R",sep=""))
}
savecode=function()
{
savehistory(paste0("D:/wd/代码/R/",today(),"代码记录.R",sep=""))
}
savecode()
