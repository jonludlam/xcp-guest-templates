(*
 * Copyright (C) Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)


module X = Xen_api_lwt_unix

let rpc =
  let uri = Printf.sprintf "http://localhost/" in
  let rpc = X.make uri in
  rpc

let main () =
    lwt session_id = X.Session.login_with_password ~rpc ~uname:"root" ~pwd:"Qx9xbs0v" ~version:"1.0" in
    lwt () = Create_templates.create_all_templates rpc session_id in
    X.Session.logout rpc session_id

let _ = 
    Lwt_main.run (main ())
