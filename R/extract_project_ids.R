#'Extract buko project ID from Inspector Course Names
#'
#'This function uses a regular expression to find a 4-6 digit code in the course_name field of a data frame
#'@param inspector_data a data frame including a field course_name
#'@keywords inspector buko
#'@export
#'@examples
#'extract_project_ids()

#find the project id within the course name in inspector

extract_project_ids<-function(inspector_data){
  
  if("course_name" %in% colnames(inspector_data)){
    
    id_found_flag<-regexpr('^[0-9]{4,6}', text =  inspector_data$course_name, perl=T) # find a set of 4-6 digits in a row * need to increase this when we go over 6 digits
    inspector_data$project_id <- NA #create empty column. this way there is an "NA" when no match
    inspector_data$project_id[which(id_found_flag != -1)] <- as.numeric(regmatches(inspector_data$course_name, id_found_flag)) #put matching regexpr results in the column
    return(inspector_data)
  }
  else (print("The column name 'course_name' is not in the input dataframe. Please try again."))
  }