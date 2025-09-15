data <- read.csv("D:/spring-project-workspace/test/ubi_stress_result.csv")

data_filtered <- data[-1, ]






# 1. diff_ms를 숫자로 변환 (혹시 아직 안 했으면)
data_filtered$diff_ms <- as.numeric(as.character(data_filtered$diff_ms))

# 2. 이상치 제거 (IQR 기준)
Q1 <- quantile(data_filtered$diff_ms, 0.25, na.rm = TRUE)
Q3 <- quantile(data_filtered$diff_ms, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# 3. 이상치 제외한 데이터 생성
filtered_values <- data_filtered$diff_ms[data_filtered$diff_ms >= lower_bound & data_filtered$diff_ms <= upper_bound]

# 4. 히스토그램 그리기
hist(filtered_values,
     main = "Histogram of diff_ms (Outliers Removed)",
     xlab = "Time Difference (ms)",
     col = "skyblue",
     border = "white")
