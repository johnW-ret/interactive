#use "topfind";;
#require "base";;
#require "jupyter";;
#require "jupyter.comm";;
#require "jupyter.notebook";;

(*let target = Jupyter_comm.Manager.Target.create "dotnet_coe_handler_comm" in
let comm = Jupyter_comm.Manager.Comm.create target in   (* Send comm_open to the frontend *)
Jupyter_comm.Manager.Comm.send comm (`String "Hello") ; (* Send comm_msg to the frontend *)
Jupyter_comm.Manager.Comm.close comm*)

let target =
    Jupyter_comm.Manager.Target.create
        "__dotnet_coe_handler_comm"  
        ~recv_open:(fun comm json ->
            let _ = Jupyter_notebook.display "text/html" "<b>Hello, World!</b>" in
            ())
        ~recv_msg:(fun comm json ->
            let _ = Jupyter_notebook.display "text/html" "<b>Hello, World!</b>" in
            ()) (* Receive json = `String "msg" *)
        ~recv_close:(fun comm json ->
            let _ = Jupyter_notebook.display "text/html" "<b>Hello, World!</b>" in
            ()) (* Receive json = `String "closing" *)
(* let comm = Jupyter_comm.Manager.Comm.create ~data:(
  (Yojson.Safe.from_string {|
  {
    "data": {
        "type": "object", 
        "description": "comm message data",
        "properties": {
            "commandOrEvent": {
                "type": "string",
                "description": "serialized json string of either KernelEventEnvelope or KernelCommandEnvelope"
            }, 
            "type": {
                "type": "string",
                "description": "`command` or `event`"
            }
        }
      }
}
  |})
)  *) (* Send comm_msg to the frontend *)
(* let _ = Jupyter_comm.Manager.Comm.send comm (Yojson.Safe.from_string {|
{
  "type" : "event",
  "commandOrEvent" : 
  {
    "kernelInfos" : []
  }
}
|})
let _ = Jupyter_comm.Manager.Comm.close comm *)