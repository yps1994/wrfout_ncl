load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

loadscript ("./module_input_single.ncl")                ;control input file setting (single file)
loadscript ("./module_output_type.ncl")                 ;output setting for gsn_open_wks
loadscript ("./module_basemap_mpres.ncl")               ;mpres setting

loadscript ("./module_contour_skin_temperature.ncl")    ;res and colormap setting

begin

  pltres = True

  times = wrf_user_getvar(a,"times",-1)  ; get all times in the file
  ntimes = dimsizes(times)         ; number of times in the file

  do it = 0,ntimes-1,1

      print("Working on time: " + times(it) )
      res@TimeLabel = times(it)   ; Set Valid time to use on plots

      temperature = wrf_user_getvar(a, "TSK", it)
      temperature = temperature-273.15
      temperature@description = "SKIN TEMPERATURE"
      temperature@units = "deg C"

      wks = gsn_open_wks(type,"Skin_Temperature_Single")
      contour = wrf_contour(a,wks,temperature,res)
      gsn_define_colormap(wks, colormap)
      plot = wrf_map_overlays(a,wks,(/contour/),pltres,mpres)

    end do      ; END OF LEVEL LOOP
   
end
