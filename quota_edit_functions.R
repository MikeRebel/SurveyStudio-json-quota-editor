if (!any(installed.packages()[,1] == "jsonlite")){
install.packages("jsonlite")
}
if (!any(installed.packages()[,1] == "maditr")){
     install.packages("maditr")
}
if (!any(installed.packages()[,1] == "openxlsx")){
        install.packages("openxlsx")
}
options(scipen = 999)
library("jsonlite")
library("maditr")
library("openxlsx")

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

# Recursive function to extract names and quota values
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

# Recursive function to extract full quota names and quotas values
full_names_extract_counters <- function(counters, parent_quota_name=NULL) {
        result <- data.frame(Name = character(), Quota = numeric(), stringsAsFactors = FALSE)
        current_quota_name = ""
        for (x in 1:nrow(counters)) {
                # Extract current counter
                # browser()
                counter <- counters[x,]
                result <- rbind(result, data.frame(Name = paste0(parent_quota_name, counter$Name), Quota = counter$Quota))
                current_quota_name <- parent_quota_name
                # If children exist, process them recursively
                if (!is.null(nrow(counter$Children[[1]])) && nrow(counter$Children[[1]]) > 0) {
                        quota_name <- paste0(parent_quota_name, counter$Name," <- ")
                        result <- rbind(result, full_names_extract_counters(counter$Children[[1]],quota_name))
                } 
                # else {
                #         restore_quota_name <- strsplit(parent_quota_name," <- ",fixed = TRUE)
                #         quota_name_length <- length(restore_quota_name[[1]]) - 1
                #         parent_quota_name <- restore_quota_name[[1]][1:quota_name_length]
                #         parent_name=""
                #         for (name in parent_quota_name) {
                #                 if(nchar(parent_name) == 0) {
                #                         parent_name <- name
                #                 } else {
                #                         parent_name <- paste0(parent_name, " <- ", name)
                #                         parent_name
                #                 }
                #         }
                # }
               
                
        }
        # restore quota parent name after recursion iteration exit
        parent_quota_name <- current_quota_name
        return(result)
}

# Recursive function to extract sums of quota values in all child
extract_counters <- function(counter_values) {
        quota_sums_names <- strsplit(counter_values$Name," <- ",fixed = TRUE)
        
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

# View full quota names function
full_view_quota <-  function(json_data) {
        
        Counter_data <- json_data$Counters
        result <- data.frame(
                Name = character(), 
                Quota = numeric(), 
                stringsAsFactors = FALSE
        )
        result <- full_names_extract_counters(Counter_data)
        result
        
}

# Edit function by quota name
# The edit_json_file_by_quota_name function takes the JSON data, a quota name, and a new quota value as input, 
# and updates the quota value for the specified quota name. The function loops through the Counters list and checks 
# if the Name property of each quota matches the specified quota name. If a match is found, 
# the function updates the Quota property for that quota.
edit_json_file_by_quota_name <- function(json_data, quota_name, new_quota_value) {
     
     # browser()
       j<- json_data$Counters[json_data$Counters$Name==quota_name]
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

# edit_json_file_by_quota_viev <- function(json_data, quota_name, new_quota_value) {
#         # quota_to_edit <- quota_names_view == "Северо-Западный федеральный округ. Первая волна. Короткие и длинные. <- Архангельская область + АО <- Архангельская область + АО 400к"
#         quota_name <- "Северо-Западный федеральный округ. Первая волна. Короткие и длинные. <- Архангельская область + АО <- Архангельская область + АО 400к"
#         quota_to_edit <- strsplit(quota_name," <- ",fixed = TRUE)
#         browser()
#         
#         while( i != length(quota_to_edit[[1]])) {
#                 
#                 
#                 
#         }
#         
#         j <- json_data$Counters[json_data$Counters$Name %in% quota_to_edit[[1]][1]]
#         ifelse(json_data$Counters$Name == quota_name,new_quota_value,json_data$Counters$Quota)
#         
#         for (i in 1:nrow(json_data$Counters)) {
#                 if (json_data$Counters$Name[[i]] == quota_name) {
#                         json_data$Counters$Quota[[i]] <- new_quota_value
#                         break
#                         if (is.null(nrow(json_data$Counters$Children[[i]]))) {
#                                 break 
#                         } else {
#                                 for (j in 1:nrow(json_data$Counters$Children[[i]])) {
#                                         if (json_data$Counters$Children[[i]]$Name[[j]] == quota_name) {
#                                                 json_data$Counters$Children[[i]]$Quota[[j]] == new_quota_value
#                                                 break
#                                         }
#                                 }
#                         }
#                 }
#         }
#         return(json_data)
# }

# The edit_json_file_by_quota_viev function takes the JSON data, a quota name, and a new quota value as input, 
# and updates the quota value for the specified quota name. The function recursively loops through the Counters list and checks 
# if the Name property of each quota matches the specified quota name. If a match is found, 
# the function updates the Quota property for that quota.
edit_json_file_by_quota_viev <- function(json_data, quota_name, new_quota_value) {
        # Split the quota_name into levels using " <- " as the delimiter
        levels <- unlist(strsplit(quota_name, " <- "))
        # browser()
        # Recursive function to find and update the quota value
        update_quota <- function(node, levels, new_value) {
                if (length(levels) == 1) {
                        # browser() 
                        # If no more levels to go through, update the Quota value
                        change_vector <- node[["Name"]] == levels
                        if (any(change_vector)) {
                                
                                node[["Quota"]] <- ifelse(change_vector, new_value, node[["Quota"]])
                                
                        }
                        # node[["Name"]] <- new_value
                        return(node)
                } else {
                        # Find the next level in the Children list
                        # browser()
                        next_level <- levels[1]
                        remaining_levels <- gsub("\n","",levels[-1],fixed = TRUE)
                        
                        for (i in seq_along(node$Children)) {
                                if (!is.null(nrow(node$Children[[i]]))) {
                                        if (any(node$Children[[i]]$Name == remaining_levels)) {
                                                if(length(remaining_levels) == 1) {
                                                        change_vector <- node$Children[[i]]$Name == remaining_levels
                                                        if (any(change_vector)) {
                                                                # browser()
                                                                node$Children[[i]][["Quota"]] <- ifelse(change_vector, new_value, node$Children[[i]][["Quota"]])
                                                                return(node)
                                                        }
                                                } else {
                                                        # Recursively update the quota in the child node
                                                        # browser()
                                                        node$Children[[i]] <- update_quota(node$Children[[i]], remaining_levels, new_value)
                                                        return(node)
                                                }
                                        }
                                }
                        }
                        # If the level is not found, return the original node (no change)
                        print("no change")
                        return(node)
                }
        }
        
        # Start updating from the Counters node
        json_data$Counters <- update_quota(json_data$Counters, levels, new_quota_value)
        
        return(json_data)
}

# edit_json_file_by_quota_viev_V3 <- function(json_data, quota_name, new_quota_value) {
#         # Разбиваем путь на компоненты
#         parts <- strsplit(quota_name, " <- ", fixed = TRUE)[[1]]
#         
#         # Проверка корневого имени (с обработкой вектора)
#         root_name <- json_data$Counters$Name
#         if (length(root_name) > 1) {
#                 root_name <- paste(root_name, collapse = " ") # или другая логика объединения
#         }
#         if (parts[1] != root_name) {
#                 warning("Root name mismatch")
#                 return(json_data)
#         }
#         
#         # Рекурсивная функция для поиска пути
#         find_node <- function(children, path_parts) {
#                 if (length(path_parts) == 0) return(NULL)
#                 
#                 for (i in seq_along(children)) {
#                         if (children[[i]]$Name == path_parts[1]) {
#                                 if (length(path_parts) == 1) {
#                                         return(list(index = i, children = children))
#                                 }
#                                 result <- find_node(children[[i]]$Children, path_parts[-1])
#                                 if (!is.null(result)) {
#                                         return(list(index = c(i, result$index), 
#                                                     children = result$children))
#                                 }
#                         }
#                 }
#                 NULL
#         }
#         
#         # Ищем целевой узел
#         result <- find_node(json_data$Counters$Children, parts[-1])
#         if (is.null(result)) {
#                 warning("Path not found")
#                 return(json_data)
#         }
#         
#         # Модифицируем Quota
#         eval(parse(text = paste0(
#                 "json_data$Counters$Children[[", 
#                 paste(result$index, collapse = "]]$Children[["), 
#                 "]]$Quota <- new_quota_value"
#         )))
#         
#         return(json_data)
# }

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

