load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"


begin

  ExplicitLevels = 0  			;1 = turns on explicit level. otherwise turns on manual level.

  res = True
  res@MainTitle = "REAL-TIME WRF"
  res@cnFillOn          = True

  if (ExplicitLevels .eq. 1) then
	  res@cnLevelSelectionMode = "ExplicitLevels" ; manually set the contour levels with the following 3 resources
	  res@cnLevels = ispan(0,10,2)

      colormap = (/"white","black","white", \
  		            "white","steelblue1","seagreen3","springgreen1","yellow1","tan1"/)

	  print("ExplicitLevels = 1. Plot using res@cnLevelSelectionMode=ExplicitLevels.")
	  print("Colormap setting is overrided. You may customize the colormap in module_contour_windspeed.ncl")
  else
	  res@cnLevelSelectionMode = "ManualLevels" ; manually set the contour levels with the following 3 resources
	  res@cnMinLevelValF  = 0.     ; set the minimum contour level
	  res@cnMaxLevelValF  = 10.     ; set the maximum contour level
	  res@cnLevelSpacingF = 1      ; set the interval between contours

	  colormap = "ncl_default"

	  print("ExplicitLevels != 1. Plot using res@cnLevelSelectionMode=ManualLevels.")

  end if
   
end
