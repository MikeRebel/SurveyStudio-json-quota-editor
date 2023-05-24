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
json_data <- edit_json_file_by_quota_name(json_data, "Полные интервью", 5000)

json_data <- edit_json_file_by_quota_name(json_data, "Абакан", 1)
json_data <- edit_json_file_by_quota_name(json_data, "Архангельск", 2)
json_data <- edit_json_file_by_quota_name(json_data, "Астрахань", 3)
json_data <- edit_json_file_by_quota_name(json_data, "Барнаул", 4)
json_data <- edit_json_file_by_quota_name(json_data, "Белгород", 5)
json_data <- edit_json_file_by_quota_name(json_data, "Благовещенск", 6)
json_data <- edit_json_file_by_quota_name(json_data, "Брянск", 7)
json_data <- edit_json_file_by_quota_name(json_data, "Великий Новгород", 8)
json_data <- edit_json_file_by_quota_name(json_data, "Владивосток", 9)
json_data <- edit_json_file_by_quota_name(json_data, "Владикавказ", 10)
json_data <- edit_json_file_by_quota_name(json_data, "Владимир", 11)
json_data <- edit_json_file_by_quota_name(json_data, "Волгоград", 12)
json_data <- edit_json_file_by_quota_name(json_data, "Вологда", 13)
json_data <- edit_json_file_by_quota_name(json_data, "Воронеж", 14)
json_data <- edit_json_file_by_quota_name(json_data, "Грозный", 15)
json_data <- edit_json_file_by_quota_name(json_data, "Екатеринбург", 16)
json_data <- edit_json_file_by_quota_name(json_data, "Иваново", 17)
json_data <- edit_json_file_by_quota_name(json_data, "Ижевск", 18)
json_data <- edit_json_file_by_quota_name(json_data, "Йошкар-Ола", 19)
json_data <- edit_json_file_by_quota_name(json_data, "Иркутск", 20)
json_data <- edit_json_file_by_quota_name(json_data, "Казань", 21)
json_data <- edit_json_file_by_quota_name(json_data, "Калининград", 22)
json_data <- edit_json_file_by_quota_name(json_data, "Калуга", 23)
json_data <- edit_json_file_by_quota_name(json_data, "Кемерово", 24)
json_data <- edit_json_file_by_quota_name(json_data, "Киров", 25)
json_data <- edit_json_file_by_quota_name(json_data, "Кострома", 26)
json_data <- edit_json_file_by_quota_name(json_data, "Краснодар", 27)
json_data <- edit_json_file_by_quota_name(json_data, "Красноярск", 28)
json_data <- edit_json_file_by_quota_name(json_data, "Курган", 29)
json_data <- edit_json_file_by_quota_name(json_data, "Курск", 30)
json_data <- edit_json_file_by_quota_name(json_data, "Кызыл", 31)
json_data <- edit_json_file_by_quota_name(json_data, "Липецк", 32)
json_data <- edit_json_file_by_quota_name(json_data, "Майкоп", 33)
json_data <- edit_json_file_by_quota_name(json_data, "Махачкала", 34)
json_data <- edit_json_file_by_quota_name(json_data, "Москва", 35)
json_data <- edit_json_file_by_quota_name(json_data, "Мурманск", 36)
json_data <- edit_json_file_by_quota_name(json_data, "Назрань", 37)
json_data <- edit_json_file_by_quota_name(json_data, "Нальчик", 38)
json_data <- edit_json_file_by_quota_name(json_data, "Нефтеюганск", 39)
json_data <- edit_json_file_by_quota_name(json_data, "Нижневартовск", 40)
json_data <- edit_json_file_by_quota_name(json_data, "Нижний Новгород", 41)
json_data <- edit_json_file_by_quota_name(json_data, "Новокузнецк", 42)
json_data <- edit_json_file_by_quota_name(json_data, "Новосибирск", 43)
json_data <- edit_json_file_by_quota_name(json_data, "Новый Уренгой", 44)
json_data <- edit_json_file_by_quota_name(json_data, "Норильск", 45)
json_data <- edit_json_file_by_quota_name(json_data, "Ноябрьск", 46)
json_data <- edit_json_file_by_quota_name(json_data, "Омск", 47)
json_data <- edit_json_file_by_quota_name(json_data, "Орёл", 48)
json_data <- edit_json_file_by_quota_name(json_data, "Оренбург", 49)
json_data <- edit_json_file_by_quota_name(json_data, "Пенза", 50)
json_data <- edit_json_file_by_quota_name(json_data, "Пермь", 51)
json_data <- edit_json_file_by_quota_name(json_data, "Петрозаводск", 52)
json_data <- edit_json_file_by_quota_name(json_data, "Петропавловск-Камчатский", 53)
json_data <- edit_json_file_by_quota_name(json_data, "Псков", 54)
json_data <- edit_json_file_by_quota_name(json_data, "Ростов-на-Дону", 55)
json_data <- edit_json_file_by_quota_name(json_data, "Рязань", 56)
json_data <- edit_json_file_by_quota_name(json_data, "Самара", 57)
json_data <- edit_json_file_by_quota_name(json_data, "Санкт-Петербург", 58)
json_data <- edit_json_file_by_quota_name(json_data, "Саранск", 59)
json_data <- edit_json_file_by_quota_name(json_data, "Сарапул", 60)
json_data <- edit_json_file_by_quota_name(json_data, "Саратов", 61)
json_data <- edit_json_file_by_quota_name(json_data, "Сахалин", 62)
json_data <- edit_json_file_by_quota_name(json_data, "Смоленск", 63)
json_data <- edit_json_file_by_quota_name(json_data, "Ставрополь", 64)
json_data <- edit_json_file_by_quota_name(json_data, "Сургут", 65)
json_data <- edit_json_file_by_quota_name(json_data, "Сыктывкар", 66)
json_data <- edit_json_file_by_quota_name(json_data, "Тамбов", 67)
json_data <- edit_json_file_by_quota_name(json_data, "Тверь", 68)
json_data <- edit_json_file_by_quota_name(json_data, "Томск", 69)
json_data <- edit_json_file_by_quota_name(json_data, "Тула", 70)
json_data <- edit_json_file_by_quota_name(json_data, "Тюмень", 71)
json_data <- edit_json_file_by_quota_name(json_data, "Улан-Удэ", 72)
json_data <- edit_json_file_by_quota_name(json_data, "Ульяновск", 73)
json_data <- edit_json_file_by_quota_name(json_data, "Уфа", 74)
json_data <- edit_json_file_by_quota_name(json_data, "Хабаровск", 75)
json_data <- edit_json_file_by_quota_name(json_data, "Чебоксары", 76)
json_data <- edit_json_file_by_quota_name(json_data, "Челябинск", 77)
json_data <- edit_json_file_by_quota_name(json_data, "Череповец", 78)
json_data <- edit_json_file_by_quota_name(json_data, "Чита", 79)
json_data <- edit_json_file_by_quota_name(json_data, "Элиста", 80)
json_data <- edit_json_file_by_quota_name(json_data, "Якутск", 81)
json_data <- edit_json_file_by_quota_name(json_data, "Ярославль", 82)

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


