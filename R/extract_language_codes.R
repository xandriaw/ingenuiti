#'Extract buko Language Code from Inspector Course Names
#'
#'This function uses a regular expression to find a 4-6 digit code in the course_name field of a data frame
#'@param inspector_data a data frame including a field course_name
#'@keywords inspector buko
#'@export
#'@examples
#'extract_language_codes()

#find the project id within the course name in inspector

extract_language_codes<-function(inspector_data){
  
  if("course_name" %in% colnames(inspector_data)){
    
    #find the language code within the course name in inspector
    l_code_found_flag<-regexpr('\\s[A-Z]{2}-[A-Z]{2}|\\s[A-Z]{2}', text=inspector_data$course_name, perl=T) #find a set of 2 capital letters, hyphen, 2 letters or just two letters
    inspector_data$course_language<-NA
    inspector_data$course_language[which(l_code_found_flag != -1)] <- regmatches(inspector_data$course_name, l_code_found_flag)
    
    return(inspector_data)
  }
  else (print("The column name 'course_name' is not in the input dataframe. Please try again."))
  }