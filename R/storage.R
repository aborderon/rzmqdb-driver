#' Storage.
#'
#' @docType class
#' @import R6
#' @import fst
#' @import rzmq
#' @return Object of \code{\link{R6Class}}.
#' @format \code{\link{R6Class}} object.
#' @section Methods:
#' \describe{
#'   \item{\code{new(obj)}}{This method is used to create object of this class.}
#'   }
Storage <- R6Class(
  "Storage",
  private = list(
    remote.exec = function(socket, fun,...) {
      send.socket(socket,data=list(fun=fun,args=list(...)))
      receive <- receive.socket(socket)
      return(receive)
    }
  ),

  public = list(
    initialize = function(){},

    select = function(environmentId,document,key){
      # Init socket
      context = init.context()
      socket = init.socket(context,"ZMQ_REQ")
      connect.socket(socket, "tcp://0.0.0.0:5555")
      # Get value
      if(private$remote.exec(socket,"exists(environmentId)",list('environmentId',environmentId))){
        if(private$remote.exec(socket,"exists(document, envir = base::get(environmentId))",list('environmentId',environmentId),list('document',document))){
          if(private$remote.exec(socket,"exists(key, envir = base::get(document, envir = base::get(environmentId)))",list('environmentId',environmentId),list('document',document),list('key',key))){
            return(
              unserialize(
                fst::decompress_fst(
                  private$remote.exec(
                    socket,
                    "base::get(key, envir = base::get(document, envir = base::get(environmentId)))",
                    list('environmentId',environmentId),
                    list('document',document),
                    list('key',key)
                  )
                )
              )
            )
          }
          else{
            disconnect.socket(socket, "tcp://0.0.0.0:5555")
            stop("Key not found")
          }
        }else{
          disconnect.socket(socket, "tcp://0.0.0.0:5555")
          stop("Document not found")
        }
      }else{
        disconnect.socket(socket, "tcp://0.0.0.0:5555")
        stop("Environment not found")
      }
      disconnect.socket(socket, "tcp://0.0.0.0:5555")
    },

    insert = function(environmentId,document,key,value){
      # Init socket
      context = init.context()
      socket = init.socket(context,"ZMQ_REQ")
      connect.socket(socket, "tcp://0.0.0.0:5555")
      # Create Environment
      if(!private$remote.exec(socket,"exists(environmentId)",list('environmentId',environmentId))){
        private$remote.exec(socket,"assign(environmentId, new.env()); 0",list('environmentId',environmentId))
      }
      # Create Document
      if(private$remote.exec(socket,"exists(environmentId)",list('environmentId',environmentId))){
        private$remote.exec(socket,"assign(document, new.env(), envir = base::get(environmentId)); 0",list('environmentId',environmentId),list('document',document))
      }else{
        disconnect.socket(socket, "tcp://0.0.0.0:5555")
        stop("Environment not found")
      }
      # Insert data
      if(private$remote.exec(socket,"exists(environmentId)",list('environmentId',environmentId))){
        if(private$remote.exec(socket,"exists(document, envir = base::get(environmentId))",list('environmentId',environmentId),list('document',document))){
            private$remote.exec(
              socket,
              "assign(key, value, envir = base::get(document, envir = base::get(environmentId))); 0",
              list('key',key),
              list('value', fst::compress_fst(serialize(value,NULL),compressor = "LZ4", compression = 100)),
              list('environmentId',environmentId),
              list('document',document))
        }else{
          disconnect.socket(socket, "tcp://0.0.0.0:5555")
          stop("Document not found")
        }
      }else{
        disconnect.socket(socket, "tcp://0.0.0.0:5555")
        stop("Environment not found")
      }
      disconnect.socket(socket, "tcp://0.0.0.0:5555")
    }
  )
)
