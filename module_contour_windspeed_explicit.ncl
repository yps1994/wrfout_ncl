load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"


begin

  res = True
  res@MainTitle = "REAL-TIME WRF"
  res@cnFillOn          = True
  res@cnLevelSelectionMode = "ExplicitLevels" ; manually set the contour levels with the following 3 resources
  res@cnLevels = ispan(0,10,2)
end
