source("quota_edit_functions.R")
Quota_file_name = "counters_test_tricolor"
json_data <- read_json_file(paste0(Quota_file_name,".json"))

# Формирует список квот
quotas <- extract_counters(json_data$Counters)

# Формирует список квот с названиями родительской квоты в каждой
quota_names <- Full_names_extract_counters(json_data$Counters)

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
saveWorkbook(wb,paste0("Список квот.xlsx"),overwrite = TRUE)

json_data <- edit_json_file_by_quota_name(json_data, "Полные интервью", 30100)

json_data$Counters$Id <- json_data$Counters$StringId
json_data[["Counters"]][["Children"]][[5]]$Id <- json_data[["Counters"]][["Children"]][[5]]$StringId
write_json_file(json_data, paste0(Quota_file_name,"_edited.json"))

