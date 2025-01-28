source("quota_edit_functions.R")
Quota_file_name = "counters_test_tricolor"
json_data <- read_json_file(paste0(Quota_file_name,".json"))

# Формирует список квот из фрейма Counters
quotas <- extract_counters(json_data$Counters)
# Из фрейма Counters формирует список квот с названиями родительской квоты в каждой
quota_names <- full_names_extract_counters(json_data$Counters)

easy_edit_code <- data.frame(
     `Название квоты` <- quota_names$Name,
     `Текущая квота` <- quota_names$Quota,
     `Новая квота` <- quota_names$Quota,
     `Скрипт1` <- "json_data <- edit_json_file_by_quota_viev(json_data, \"",
     `Скрипт2` <- "\", ",
     `Скрипт3` <- ")",
     `Скопировать и выполнить этот  скрипт в R` <- ""
)

easy_edit_code$`X.Скопировать.и.выполнить.этот..скрипт.в.R.......`[1] = "=D2&A2&E2&C2&F2"
names(easy_edit_code)[1] <- "Название квоты"
names(easy_edit_code)[2] <- "Текущая квота"
names(easy_edit_code)[3] <- "Новая квота"
names(easy_edit_code)[4] <- "Скрипт1"
names(easy_edit_code)[5] <- "Скрипт2"
names(easy_edit_code)[6] <- "Скрипт3"
names(easy_edit_code)[7] <- "Скопировать и выполнить этот  скрипт в R"


wb<-createWorkbook(
          creator = ifelse(.Platform$OS.type == "windows", 
                           Sys.getenv("USERNAME"),
                           Sys.getenv("USER")),
          title = NULL,
          subject = NULL,
          category = NULL
      )
addWorksheet(wb,"Список квот")
writeData(wb,"Список квот", quotas)
addWorksheet(wb,"Полные названия квот")
writeData(wb,"Полные названия квот", quota_names)
addWorksheet(wb,"Новые квоты в столбце C")
writeData(wb,"Новые квоты в столбце C", easy_edit_code)
saveWorkbook(wb,paste0("Список квот.xlsx"),overwrite = TRUE)

#Эти функции принимают в качестве параметра весь объект json_data а не только счетчики.
quota_view <- view_quota(json_data)
quota_names_view <- full_view_quota(json_data)

json_data <- edit_json_file_by_quota_viev(json_data, "Полные интервью", 30300)
json_data <- edit_json_file_by_quota_viev(json_data, "Северо-Западный федеральный округ. Первая волна. Короткие и длинные. <- Архангельская область + АО
", 110)
json_data <- edit_json_file_by_quota_viev(json_data, "Северо-Западный федеральный округ. Первая волна. Короткие и длинные. <- Архангельская область + АО <- Архангельская область + АО 45к
", 55)

quota_names_edited <- full_names_extract_counters(json_data$Counters)
quota_names == quota_names_edited

# для проверки новых квот формируем в файле лист с обновленными квотами
addWorksheet(wb,"Полные названия новых квот")
writeData(wb,"Полные названия новых квот", quota_names_edited)
saveWorkbook(wb,paste0("Список квот.xlsx"),overwrite = TRUE)


# json_data$Counters$Id <- json_data$Counters$StringId
# json_data[["Counters"]][["Children"]][[5]]$Id <- json_data[["Counters"]][["Children"]][[5]]$StringId
write_json_file(json_data, paste0(Quota_file_name,"_edited.json"))

