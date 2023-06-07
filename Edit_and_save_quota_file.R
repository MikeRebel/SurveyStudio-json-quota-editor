source("quota_edit_functions.R")

# extract advanced editor quotas from Survey Studio project, download json file and place it to this script directory

# read,change and save quota file by id

#copy extracted file name here without externsion
Quota_file_name = "counters"
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
json_data <- edit_json_file_by_quota_name(json_data, "Полные интервью", 2922)
json_data <- edit_json_file_by_quota_name(json_data, "14 – 19", 98)
json_data <- edit_json_file_by_quota_name(json_data, "20 – 29", 756)
json_data <- edit_json_file_by_quota_name(json_data, "30 – 39", 971)
json_data <- edit_json_file_by_quota_name(json_data, "40 – 49", 655)
json_data <- edit_json_file_by_quota_name(json_data, "50 – 60", 442)
json_data <- edit_json_file_by_quota_name(json_data, "МТС - Регион Москва", 208)
json_data <- edit_json_file_by_quota_name(json_data, "Билайн - Регион Москва", 158)
json_data <- edit_json_file_by_quota_name(json_data, "Мегафон - Регион Москва", 212)
json_data <- edit_json_file_by_quota_name(json_data, "Теле2 - Регион Москва", 138)
json_data <- edit_json_file_by_quota_name(json_data, "Йота - Регион Москва", 27)
json_data <- edit_json_file_by_quota_name(json_data, "Тинькофф мобайл - Регион Москва", 10000)
json_data <- edit_json_file_by_quota_name(json_data, "МТС - регион Другие регионы", 486)
json_data <- edit_json_file_by_quota_name(json_data, "Билайн - регион Другие регионы", 564)
json_data <- edit_json_file_by_quota_name(json_data, "Мегафон - регион Другие регионы", 493)
json_data <- edit_json_file_by_quota_name(json_data, "Теле2 - регион Другие регионы", 507)
json_data <- edit_json_file_by_quota_name(json_data, "Йота - регион Другие регионы", 129)
json_data <- edit_json_file_by_quota_name(json_data, "Тинькофф мобайл - регион Другие регионы", 10000)
json_data <- edit_json_file_by_quota_name(json_data, "Приморский край", 71)
json_data <- edit_json_file_by_quota_name(json_data, "Алтайский край", 58)
json_data <- edit_json_file_by_quota_name(json_data, "Новосибирская область", 59)
json_data <- edit_json_file_by_quota_name(json_data, "Красноярский край (кроме Норильска)", 89)
json_data <- edit_json_file_by_quota_name(json_data, "Кемеровская область (кроме Новокузнецка)", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Омская область", 23)
json_data <- edit_json_file_by_quota_name(json_data, "Хабаровский край", 23)
json_data <- edit_json_file_by_quota_name(json_data, "Иркутская область", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Томская область", 0)
json_data <- edit_json_file_by_quota_name(json_data, "Восток: другое", 35)
json_data <- edit_json_file_by_quota_name(json_data, "Ленинградская область", 150)
json_data <- edit_json_file_by_quota_name(json_data, "Ярославская область", 12)
json_data <- edit_json_file_by_quota_name(json_data, "Калининградская область", 17)
json_data <- edit_json_file_by_quota_name(json_data, "Костромская область", 36)
json_data <- edit_json_file_by_quota_name(json_data, "Смоленская область", 42)
json_data <- edit_json_file_by_quota_name(json_data, "Тверская область", 31)
json_data <- edit_json_file_by_quota_name(json_data, "Ивановская область", 35)
json_data <- edit_json_file_by_quota_name(json_data, "Тульская область", 28)
json_data <- edit_json_file_by_quota_name(json_data, "Запад: другое", 53)
json_data <- edit_json_file_by_quota_name(json_data, "Московская область", 743)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Татарстан", 53)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Башкортостан", 68)
json_data <- edit_json_file_by_quota_name(json_data, "Свердловская область", 80)
json_data <- edit_json_file_by_quota_name(json_data, "Самарская область", 89)
json_data <- edit_json_file_by_quota_name(json_data, "Челябинская область", 68)
json_data <- edit_json_file_by_quota_name(json_data, "Саратовская область", 78)
json_data <- edit_json_file_by_quota_name(json_data, "Нижегородская область", 82)
json_data <- edit_json_file_by_quota_name(json_data, "Тюменская область", 11)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Марий Эл", 27)
json_data <- edit_json_file_by_quota_name(json_data, "Пензенская область", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Курганская область", 44)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Мордовия", 35)
json_data <- edit_json_file_by_quota_name(json_data, "Пермский край", 45)
json_data <- edit_json_file_by_quota_name(json_data, "Чувашская Республика", 19)
json_data <- edit_json_file_by_quota_name(json_data, "Центр: другое", 66)
json_data <- edit_json_file_by_quota_name(json_data, "Краснодарский край", 48)
json_data <- edit_json_file_by_quota_name(json_data, "Ставропольский край", 83)
json_data <- edit_json_file_by_quota_name(json_data, "Ростовская область", 102)
json_data <- edit_json_file_by_quota_name(json_data, "Волгоградская область", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Воронежская область", 75)
json_data <- edit_json_file_by_quota_name(json_data, "Республика Дагестан", 23)
json_data <- edit_json_file_by_quota_name(json_data, "Астраханская область", 14)
json_data <- edit_json_file_by_quota_name(json_data, "Липецкая область", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Чеченская Республика", 30)
json_data <- edit_json_file_by_quota_name(json_data, "Брянская область", 36)
json_data <- edit_json_file_by_quota_name(json_data, "Юг: другое", 47)


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


