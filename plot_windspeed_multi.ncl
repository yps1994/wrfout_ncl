load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

loadscript ("./module_input_multi.ncl")                ;control input file setting (multiple files)
loadscript ("./module_output_type.ncl")                ;output setting for gsn_open_wks
loadscript ("./module_basemap_mpres.ncl")              ;mpres setting

loadscript ("./module_contour_windspeed.ncl")          ;res setting

begin

  pltres = True

  times = wrf_user_getvar(a,"times",-1)  ; get all times in the file
  ntimes = dimsizes(times)         ; number of times in the file

  do it = 0,ntimes-1,1

      print("Working on time: " + times(it) )
      res@TimeLabel = times(it)   ; Set Valid time to use on plots

      uv10 = wrf_user_getvar(a, "uvmet10", it)
      u = uv10(0,:,:)
      v = uv10(1,:,:)
      Windspeed = sqrt(u*u+v*v)
      Windspeed@description = "WIND SPEED"
      Windspeed@units = "ms^-1"

      wks = gsn_open_wks(type,"Windspeed_" + sprinti("%03i",it))
      contour = wrf_contour(a[0],wks,Windspeed,res)

      gsn_define_colormap(wks, colormap)

      plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)


    end do      ; END OF LEVEL LOOP
   
end
