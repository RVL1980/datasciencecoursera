corr<-function(directory, threshold=0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  ## generate character-vector of all filenames
  files<-list.files(directory)

  thres<-function(x){
    ## thres is a function that reads a file, counts how many complete
    ## cases are in there, and calculates the correlation between nitrate
    ## and sulfate in that file if the number of complete cases
    ## is higher than the threshold
    
    ## read in the file x in the given directory
    file<-read.csv(paste(directory,"/",x,sep=""))
    ## calculate number of complete cases
    sum<-sum(complete.cases(file))
    
    ## give correlation if sum>threshold 
      if (sum>threshold){
          cor(file$nitrate,file$sulfate,use="complete.obs")}
  }

  ## pass function 'thres' to all the filenames in character-vector 'files'
  ## giving a list with correlations and NULL-values
  final_list<-sapply(files,thres)
  ## remove all NULLs frm list and unlist to generate vector, and remove names
  final<-unname(unlist(final_list[!sapply(final_list, is.null)]))
  ## give final vector with correlations
return(final)
}
