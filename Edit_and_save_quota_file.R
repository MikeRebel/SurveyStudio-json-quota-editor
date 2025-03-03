source("quota_edit_functions.R")

# extract advanced editor quotas from Survey Studio project, download json file and place it to this script directory

# read,change and save quota file by id

#copy extracted file name here without externsion
Quota_file_name = "d:/work/A230307 - Вымпелком, BHT/field/06_2024_BHT/counters_advanced_p39400_839557ef4b2778b9"
# Read the JSON file
# place exported file to script directory or change path and filename to counters.json
json_data <- read_json_file(paste0(Quota_file_name,".json"))


# Edit the JSON data set quota 400971858088189613 to 5000 interview
json_data <- edit_json_file(json_data, 400971858088189613, 5000)

# Write the updated JSON data to a file
write_json_file(json_data, paste0(Quota_file_name,"_edited.json"))
# load counters_edited.json to Survey Studio project


# read,change and save quota file by quota name
# Read the JSON file
# place exported file to script directory or change path and filename to counters.json
json_data <- read_json_file(paste0(Quota_file_name,".json"))

# Edit the JSON data by quota name, set quota Полные интервью то 5000 interview
json_data <- edit_json_file_by_quota_name(json_data, "Полные интервью (БЕЗ ТИНЬКОФФ)", 2930)
json_data <- edit_json_file_by_quota_name(json_data, "Не Тинькоф", 2930)
json_data <- edit_json_file_by_quota_name(json_data, "14 – 19", 202)
json_data <- edit_json_file_by_quota_name(json_data, "20 – 29", 697)
json_data <- edit_json_file_by_quota_name(json_data, "30 – 39", 913)
json_data <- edit_json_file_by_quota_name(json_data, "40 – 49", 654)
json_data <- edit_json_file_by_quota_name(json_data, "50 – 60", 464)
json_data <- edit_json_file_by_quota_name(json_data, "МТС - Регион Москва", 136)
json_data <- edit_json_file_by_quota_name(json_data, "Билайн - Регион Москва", 139)
json_data <- edit_json_file_by_quota_name(json_data, "Мегафон - Регион Москва", 137)
json_data <- edit_json_file_by_quota_name(json_data, "Теле2 - Регион Москва", 155)
json_data <- edit_json_file_by_quota_name(json_data, "Йота - Регион Москва", 44)
json_data <- edit_json_file_by_quota_name(json_data, "МТС - регион Другие регионы", 555)
json_data <- edit_json_file_by_quota_name(json_data, "Билайн - регион Другие регионы", 568)
json_data <- edit_json_file_by_quota_name(json_data, "Мегафон - регион Другие регионы", 516)
json_data <- edit_json_file_by_quota_name(json_data, "Теле2 - регион Другие регионы", 516)
json_data <- edit_json_file_by_quota_name(json_data, "Йота - регион Другие регионы", 164)
json_data <- edit_json_file_by_quota_name(json_data, "Приморский край", 66)
json_data <- edit_json_file_by_quota_name(json_data, "Алтайский край", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Новосибирская область", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Красноярский край (кроме Норильска)", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Кемеровская область (кроме Новокузнецка)", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Омская область", 30)
json_data <- edit_json_file_by_quota_name(json_data, "Хабаровский край", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Иркутская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Томская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Восток: другое", 50)
json_data <- edit_json_file_by_quota_name(json_data, "Ленинградская область", 135)
json_data <- edit_json_file_by_quota_name(json_data, "Ярославская область", 89)
json_data <- edit_json_file_by_quota_name(json_data, "Калининградская область", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Костромская область", 49)
json_data <- edit_json_file_by_quota_name(json_data, "Смоленская область", 40)
json_data <- edit_json_file_by_quota_name(json_data, "Тверская область", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Ивановская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Тульская область", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Запад: другое", 68)
json_data <- edit_json_file_by_quota_name(json_data, "Московская область", 611)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Татарстан", 73)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Башкортостан", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Свердловская область", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Самарская область", 73)
json_data <- edit_json_file_by_quota_name(json_data, "Челябинская область", 66)
json_data <- edit_json_file_by_quota_name(json_data, "Саратовская область", 66)
json_data <- edit_json_file_by_quota_name(json_data, "Нижегородская область", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Тюменская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Марий Эл", 42)
json_data <- edit_json_file_by_quota_name(json_data, "Пензенская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Курганская область", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Мордовия", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Пермский край", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Чувашская Республика", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Центр: другое", 78)
json_data <- edit_json_file_by_quota_name(json_data, "Краснодарский край", 63)
json_data <- edit_json_file_by_quota_name(json_data, "Ставропольский край", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Ростовская область", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Волгоградская область", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Воронежская область", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Дагестан", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Астраханская область", 31)
json_data <- edit_json_file_by_quota_name(json_data, "Липецкая область", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Чеченская Республика", 38)
json_data <- edit_json_file_by_quota_name(json_data, "Брянская область", 35)
json_data <- edit_json_file_by_quota_name(json_data, "Юг: другое", 48)

# 
# json_data_tojson <- jsonlite::toJSON(json_data,digits=NA)
# write_json_file(json_data_tojson, paste0(Quota_file_name,"_edited.json"))

# Write the updated JSON data to a file
write_json_file(json_data, paste0(Quota_file_name,"_edited.json"))

# load counters_edited.json to Survey Studio project

# read,change and save contractor quota in quota file by quota name and contractor id
# Read the JSON file
# place exported file to script directory or change path and filename to counters.json
json_data <- read_json_file(paste0(Quota_file_name,".json"))

# Edit the JSON data by quota name and contractor id. 
# Set quota value by quota name Полные интервью for contractor id 240 to 3000 interview
json_data <- edit_json_file_contractorquota_by_quota_name(json_data, "Полные интервью", 240, 3000)

# Write the updated JSON data to a file
write_json_file(json_data, paste0(Quota_file_name,"_edited.json"))
# load counters_edited.json to Survey Studio project


