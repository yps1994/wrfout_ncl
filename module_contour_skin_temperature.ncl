load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"


begin

  res = True
  res@MainTitle = "REAL-TIME WRF"
  res@cnFillOn          = True
  res@cnLevelSelectionMode = "ManualLevels" ; manually set the contour levels with the following 3 resources
  res@cnMinLevelValF  = 10.     ; set the minimum contour level
  res@cnMaxLevelValF  = 50.     ; set the maximum contour level
  res@cnLevelSpacingF = 1      ; set the interval between contours

  ;colormap = "ncl_default"
  colormap ="BlueYellowRed"
end
