source("quota_edit_functions.R")

# read,change and save quota file by id
# Read the JSON file
json_data <- read_json_file("path/to/file.json")

# Edit the JSON data set quota 400971858088189613 to 5000 interview
json_data <- edit_json_file(json_data, 400971858088189613, 5000)

# Write the updated JSON data to a file
write_json_file(json_data, "path/to/updated_file.json")



# read,change and save quota file by quota name
# Read the JSON file
json_data <- read_json_file("path/to/file.json")

# Edit the JSON data by quota name, set quota Полные интервью то 5000 interview
json_data <- edit_json_file_by_quota_name(json_data, "Полные интервью", 5000)

# Write the updated JSON data to a file
write_json_file(json_data, "path/to/updated_file.json")



# read,change and save contractor quota in quota file by quota name and contractor id
# Read the JSON file
json_data <- read_json_file("path/to/file.json")

# Edit the JSON data by quota name and contractor id. 
# Set quota value by quota name Полные интервью for contractor id 240 to 3000 interview
json_data <- edit_json_file_contractorquota_by_quota_name(json_data, "Полные интервью", 240, 3000)

# Write the updated JSON data to a file
write_json_file(json_data, "path/to/updated_file.json")