load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

loadscript ("./module_output_type.ncl")                 ;output setting for gsn_open_wks
loadscript ("./module_basemap_mpres.ncl")               ;mpres setting
loadscript ("./module_contour_temperature.ncl")  ;res setting
loadscript ("./module_input_multi.ncl")                ;control input file setting

begin

  pltres = True

  times = wrf_user_getvar(a,"times",-1)  ; get all times in the file
  ntimes = dimsizes(times)         ; number of times in the file


  do it = 0,ntimes-1,1

      print("Working on time: " + times(it) )
      res@TimeLabel = times(it)   ; Set Valid time to use on plots

      temperature = wrf_user_getvar(a, "T2", it)
      temperature = temperature-273.15
      temperature@description = "2 METERS TEMPERATURE"
      temperature@units = "deg C"

      wks = gsn_open_wks(type,"Temperature_2m_" + sprinti("%03i",it))
      contour = wrf_contour(a[0],wks,temperature,res)
      plot = wrf_map_overlays(a[0],wks,(/contour/),pltres,mpres)


    end do      ; END OF LEVEL LOOP
   
end
