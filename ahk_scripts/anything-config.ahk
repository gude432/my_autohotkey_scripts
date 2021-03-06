#NoTrayIcon
#SingleInstance force
SetWorkingDir %A_ScriptDir%

#include anything.ahk
#include anything-run.ahk
#include anything-run-launch-plugin.ahk
#include anything-favorite-directories.ahk
#include anything-window-switch.ahk
#include anything-process-manager.ahk
#include anything-services.ahk
#include anything-explorer-history.ahk

; anything-source: <anything_explorer_history_source>       defined in anything-explorer-history.ahk .
; anything-source: <anything_favorite_directories_source>   defined in anything-favorite-directories.ahk

; anything-source: <anything_run_source>                    defined in anything-run.ahk
; anything-source: <anything_run_launch_source>             defined in anything-run-launch-plugin.ahk

; anything-source: <anything_window_switcher_source>        define in anything-window-switch.ahk

; anything-source: <anything_services_source>        define in anything-services.ahk 

; anything-source: <anything_process_manager_source>        define in anything-process-manager.ahk


f3::
sources:=Array()
sources.insert(anything_explorer_history_source)
sources.insert(anything_favorite_directories_source)
; sources.insert(anything_run_source)
; sources.insert(anything_services_source)
; sources.insert(anything_run_source)
anything_multiple_sources(sources)
return


#r::
my_anything_properties2:=Object()
my_anything_properties2["anything_use_large_icon"]:=0
my_anything_properties2["FontSize"]:= 12
; anything_run_source["anything-execute-action-at-once-if-one"]:= "yes" ;maybe you don't want this optin , when you not familiar with "anything" (you can just comment this line)
anything_multiple_sources_with_properties(Array(anything_run_source, anything_run_launch_source ),my_anything_properties2)

return

^f3::
 sources:=Array()
 sources.Insert(anything_process_manager_source)
 ; sources.Insert(anything_services_source)
 anything_multiple_sources(sources)
return
 
^f4::
 sources:=Array()
 sources.Insert(anything_services_source)
 ; sources.Insert(anything_process_manager_source)
 if A_OSVersion in WIN_7,WIN_VISTA  ; Note: No spaces around commas.
{
    Send ^{f4}
}
 else
 {
     anything_multiple_sources(sources)
 }
return
 
^Tab::                          ;  I remap CapsLock Ctrl ,Alt , so ...
my_anything_properties:=Object()
my_anything_properties["win_width"]:= 900
my_anything_properties["win_height"]:= 380
my_anything_properties["anything_use_large_icon"]:=1
my_anything_properties["FontSize"]:= 15
 
sources:=Array()
sources.insert(anything_window_switcher_source)
anything_multiple_sources_with_properties(sources,my_anything_properties)
return
 
