data1 <- read.csv("D:/spring-project-workspace/test/spike/spike_result_ubi.csv")
data2 <- read.csv("D:/spring-project-workspace/test/spike/spike_result_SB.csv")


data_filtered1 <- data1[-1, ]
data_filtered2 <- data2[-1, ]


# 1. diff_ms를 숫자로 변환 (혹시 아직 안 했으면)
data_filtered1$diff_ms <- as.numeric(as.character(data_filtered1$diff_ms))
# 1. diff_ms를 숫자로 변환 (혹시 아직 안 했으면)
data_filtered2$diff_ms <- as.numeric(as.character(data_filtered2$diff_ms))




# 두 그룹 간의 t-검정 수행 (Welch's t-test - 기본값)
t.test(data_filtered1$diff_ms, data_filtered2$diff_ms)

