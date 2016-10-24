;*************************************************
; WRF: creat basic x-y plots. Simple variations
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"   

loadscript ("./module_input_single.ncl")                ;control input file setting
loadscript ("./module_output_type.ncl")                 ;output setting for gsn_open_wks

begin


  Times = a->Times                       ; Times is of type character

  y     = a->T2(:,50,5)                ; (Time, bottom_top, south_north, west_east)
  y@description = "Temperature"
  y@units = "Degree Celsius"

;************************************************
; For plot label, read the lat/lon location     
;************************************************
  lat   = a->XLAT(0,50, 5)
  lon   = a->XLONG(0,50, 5)
;************************************************
; create plots: Three slight variations.  
;************************************************
  wks = gsn_open_wks(type ,"WRF_xy")          ; ps,pdf,x11,ncgm,eps


  res                       = True            ; plot mods desired
;;res@gsnMaximize           = True            ; uncomment to maximize size
  res@tiMainString          = lat+"N  "+fabs(lon)+"W"
 
  plot                      = gsn_csm_xy(wks,Times&time,y,res)
end