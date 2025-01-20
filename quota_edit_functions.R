if (!any(installed.packages()[,1] == "jsonlite")){
install.packages("jsonlite")
}
if (!any(installed.packages()[,1] == "maditr")){
     install.packages("maditr")
}
options(scipen = 999)
library("jsonlite")
library("maditr")

# The read_json_file function takes a file path as input and returns the JSON data as a list. 
read_json_file <- function(file_path) {
     json_data <- jsonlite::fromJSON(file_path)
     json_data
}

# The edit_json_file function takes the JSON data, a quota ID, and a new quota value as input, and updates the quota value for the specified quota ID. 
edit_json_file <- function(json_data, quota_id, new_quota_value) {
     for (i in 1:nrow(json_data$Counters)) {
          if (json_data$Counters$Id[[i]] == quota_id) {
               json_data$Counters$Quota[[i]] <- new_quota_value
               break
          }
     }
     return(json_data)
}

# The write_json_file function takes the updated JSON data and a file path as input, and writes the JSON data to the specified file path.
write_json_file <- function(json_data, file_path) {
     jsonlite::toJSON(json_data, na="null",auto_unbox = TRUE) %>%
          writeLines(file_path,useBytes = TRUE)
          # write(file_path)
}

# Recursive function to extract names and quotas
extract_counters <- function(counters) {
        result <- data.frame(Name = character(), Quota = numeric(), stringsAsFactors = FALSE)
        
        for (x in 1:nrow(counters)) {
                # Extract current counter
                # browser()
                counter <- counters[x,]
                result <- rbind(result, data.frame(Name = counter$Name, Quota = counter$Quota))
                
                # If children exist, process them recursively
                if (!is.null(nrow(counter$Children[[1]])) && nrow(counter$Children[[1]]) > 0) {
                        result <- rbind(result, extract_counters(counter$Children[[1]]))
                }
        }
        
        return(result)
}

# View all quota function
view_quota <-  function(json_data) {
        
        Counter_data <- json_data$Counters
        result <- data.frame(
                Name = character(), 
                Quota = numeric(), 
                stringsAsFactors = FALSE
                )
        result <- extract_counters(Counter_data)
        result
        
}

# Edit function by quota name
# The edit_json_file_by_quota_name function takes the JSON data, a quota name, and a new quota value as input, 
# and updates the quota value for the specified quota name. The function loops through the Counters list and checks 
# if the Name property of each quota matches the specified quota name. If a match is found, 
# the function updates the Quota property for that quota.
edit_json_file_by_quota_name <- function(json_data, quota_name, new_quota_value) {
     
     browser()
       j<- json_data$Counters[Counters$Name==quota_name]
       ifelse(json_data$Counters$Name==quota_name,new_quota_value,json_data$Counters$Quota)
     
     for (i in 1:nrow(json_data$Counters)) {
          if (json_data$Counters$Name[[i]] == quota_name) {
                    json_data$Counters$Quota[[i]] <- new_quota_value
                    break
               if(is.null(nrow(json_data$Counters$Children[[i]]))) {
                    break 
               } else {
                    for (j in 1:nrow(json_data$Counters$Children[[i]])) {
                         if (json_data$Counters$Children[[i]]$Name[[j]] == quota_name) {
                                   json_data$Counters$Children[[i]]$Quota[[j]] == new_quota_value
                                   break
                              }
                    }
               }
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
     for (i in 1:nrow(json_data$Counters)) {
          if (json_data$Counters$Name[[i]] == quota_name) {
               for (j in 1:length(json_data$Counters$AssignedContractorData[[i]])) {
                    if (json_data$Counters$AssignedContractorData[[i]]$Id[[j]] == contractor_name) {
                         json_data$Counters$AssignedContractorData[[i]]$QuotaValue[[j]] <- new_quota_value
                         break
                    }
               }
               break
          }
     }
     return(json_data)
}

