load<-function(){
    if (!file.exists("german.rds")){
        german_url <- paste('http://archive.ics.uci.edu/ml',
                            '/machine-learning-databases/statlog',
                            '/german/german.data',
                            sep='')

         german_data <- read_delim(german_url,
                              col_names=FALSE,
                              delim = " ")
         saveRDS(german_data, "german.rds")
         print("Se creó el archivo german.rds ")

    }else{
        german_data <<- readRDS("german.rds")
        print("el archivo german.rds ya existe. Se guardarán los datos en german_data")
    }

}
german_clean_colnames <- function(names) {
    gsub("/","_",names)
    gsub("`","_",names)
}

str <- c("Regular", "expression", "examples of R language")
sub("[[A-Z]]","[[:lower:]]",str)

generalDecode <- function(x, search, replace, default = NULL) {


    #se crea un ifelse anidado por recursion
    decode.fun <- function(search, replace, default = NULL)
        if (length(search) == 0L) {
            function(x) if (is.null(default)) x else rep(default, length(x))
        } else {
            function(x) ifelse(x == search[1L], replace[1L],
                               decode.fun(tail(search,  -1L),
                                          tail(replace, -1L),
                                          default)(x))
        }

    return (decode.fun(search, replace, default)(x))
}

german_decode<-function(x){
    unlist(generalDecode(x,names(german_codes),german_codes))
}

indices_con_NAs <- function(data, porcentaje=0.2) {
    n <- if (porcentaje < 1) {
        as.integer(porcentaje  * ncol(data))
    } else {
        stop("Debes de introducir el porcentaje de columnas con NAs.")
    }
    indices <- which( apply(data, 1, function(x) sum(is.na(x))) > n )
    if (!length(indices)) {
        warning("No hay observaciones con tantos NAs
                (la respuesta de la función es vacía),
                no se recomienda indexar el data.frame con esto")
    }
    indices
    }


