if (!any(installed.packages()[,1] == "jsonlite")){
install.packages("jsonlite")
}
if (!any(installed.packages()[,1] == "maditr")){
     install.packages("maditr")
}
library("jsonlite")
library("maditr")

# The read_json_file function takes a file path as input and returns the JSON data as a list. 
read_json_file <- function(file_path) {
     json_data <- jsonlite::fromJSON(file_path)
     json_data
}

# The edit_json_file function takes the JSON data, a quota ID, and a new quota value as input, and updates the quota value for the specified quota ID. 
edit_json_file <- function(json_data, quota_id, new_quota_value) {
     for (i in 1:length(json_data$Counters)) {
          if (json_data$Counters$Id[[i]] == quota_id) {
               json_data$Counters$Quota[[i]] <- new_quota_value
               break
          }
     }
     return(json_data)
}

# The write_json_file function takes the updated JSON data and a file path as input, and writes the JSON data to the specified file path.
write_json_file <- function(json_data, file_path) {
     jsonlite::toJSON(json_data, pretty = TRUE, auto_unbox = TRUE) %>%
          writeLines(file_path)
}


# Edit function by quota name
# The edit_json_file_by_quota_name function takes the JSON data, a quota name, and a new quota value as input, 
# and updates the quota value for the specified quota name. The function loops through the Counters list and checks 
# if the Name property of each quota matches the specified quota name. If a match is found, 
# the function updates the Quota property for that quota.
edit_json_file_by_quota_name <- function(json_data, quota_name, new_quota_value) {
     for (i in 1:length(json_data$Counters)) {
          if (json_data$Counters$Name[[i]] == quota_name) {
               json_data$Counters$Quota[[i]] <- new_quota_value
               break
          }
     }
     return(json_data)
}

# Edit contractor quota function by quota name and contractor id
# The edit_json_file_contractorquota_by_quota_name function takes the 
# JSON data, a quota name, a contractor name, and a new quota value as input, 
# and updates the quota value for the specified quota name and contractor name. 
# The function loops through the Counters list and checks 
# if the Name property of each quota matches the specified quota name. 
# If a match is found, the function loops through the AssignedContractorData list 
# for that quota and checks if the Id property of each contractor matches the specified contractor name. 
# If a match is found, the function updates the QuotaValue property for that contractor.
edit_json_file_contractorquota_by_quota_name <- function(json_data, quota_name, contractor_name, new_quota_value) {
     for (i in 1:length(json_data$Counters)) {
          if (json_data$Counters$Name[[i]] == quota_name) {
               for (j in 1:length(json_data$Counters[[i]]$AssignedContractorData)) {
                    if (json_data$Counters[[i]]$AssignedContractorData[[j]]$Id == contractor_name) {
                         json_data$Counters[[i]]$AssignedContractorData[[j]]$QuotaValue <- new_quota_value
                         break
                    }
               }
               break
          }
     }
     return(json_data)
}

